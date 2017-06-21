
module Models
  class ConsignmentProduct < Base
    def self.path
      nil
    end

    schema do
      string :id
    end

    def transform
      super.tap do |hash|
        hash.merge!(
          'id' =>
             hash.slice('consignment_id', 'product_id').values.join('.')
        )
      end
    end
  end

  class Consignment < Base
    schema do
      string :id
    end

    def extra_records
      return [] unless data['deleted_at'].nil?
      products = client.get("consignments/#{data['id']}/products")['data']
      Array(products).flatten.map do |product|
        ConsignmentProduct.new(
          product.merge('consignment_id' => data['id']),
          client
        )
      end
    end
  end
end
