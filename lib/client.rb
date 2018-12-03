require 'json'
require 'logger'
require 'thread'
require 'glutton_ratelimit'

Client = Struct.new(:store, :token, :verbose, :state) do
  extend GluttonRatelimit
  MUTEX = Mutex.new
  OUTPUT = Mutex.new

  def self.requests_per_second=(rps)
    rps = rps.to_r
    if rps > 0
      rate_limit :get, rps.numerator, rps.denominator
    end
  end

  def process(model, after = 0)
    MUTEX.synchronize do
      self.state ||= Concurrent::Hash.new()
    end

    state['value'] ||= Concurrent::Hash.new()

    return unless model.path
    after = state['value'][model.stream].to_i

    records = get(model.path, after: after)

    if Array(records['data']).flatten.compact.any?
      records['data'].peach(50) do |record|
        model.new(record, self).records.flatten.each do |model_record|
          output model_record
        end
      end
      state['value'][model.stream] = records['version']['max']
    end

    output(type: :STATE, value: state)
  end

  def output(object)
    OUTPUT.synchronize do
      puts JSON.generate(object)
    end
  end

  def get(path, after: 0, page_size: 500)
      connection.get("/api/2.0/#{path}", after: after, page_size: page_size).body
  end

  private

  def log(string)
    OUTPUT.synchronize do
      (@logger ||= ::Logger.new(STDERR)).info string
    end
  end

  def connection
    MUTEX.synchronize do
      @connection ||= Faraday::Connection.new do |conn|
        conn.authorization :Bearer, token
        conn.response :json
        conn.url_prefix = "https://#{store}.vendhq.com"
        conn.response :logger, ::Logger.new(STDERR) if verbose
        conn.adapter Faraday.default_adapter
      end
    end
    @connection
  end
end
