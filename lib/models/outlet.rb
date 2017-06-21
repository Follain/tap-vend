
module Models
  class Outlet < Base
    schema do
      string :id
      string :name
      string :physical_address_1
      string :physical_address_2
      string :physical_suburb
      string :physical_city
      string :physical_postcode
      string :physical_state
      string :physical_country_id
    end

    def transform
      super.tap do |hash|
        hash.delete 'attributes'
      end
    end

    def extra_records
      data['attributes'].map do |attribute|
        OutletAttribute.new(
          attribute.merge('outlet_id' => data['id']),
          client
        )
      end
    end
  end
end
