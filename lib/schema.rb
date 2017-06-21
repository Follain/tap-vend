
Schema = Struct.new(:stream) do
  def string(name, options={})
    if options[:nil]
      properties[name.to_sym] = { type: [:string, :null] }
    else
      properties[name.to_sym] = { type: :string }
    end
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
