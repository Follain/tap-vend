
module Models
  class OutletAttribute < Base
    def self.path
      nil
    end

    schema do
      string :id
      string :outlet_id
      string :key
      string :value
    end

    def transform
      super.tap do |hash|
        hash.merge! 'id' => hash.slice('outlet_id', 'key').values.join('.')
      end
    end
  end
end
