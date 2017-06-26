
Schema = Struct.new(:stream) do
  def string(name, options={})
    if options[:nil]
      properties[name.to_sym] = { type: [:string, :null] }
    else
      properties[name.to_sym] = { type: :string }
    end
  end

  def datetime(name)
    properties[name.to_sym] = {
      type: [:string, :null],
      format: 'date-time'
    }
  end

  def timestamps
    datetime :created_at
    datetime :updated_at
  end

  def properties
    @properties ||= {}
  end

  def to_hash
    {
      type: :SCHEMA,
      stream: stream,
      key_properties: [:id],
      schema: {
        properties: properties
      }
    }
  end
end
