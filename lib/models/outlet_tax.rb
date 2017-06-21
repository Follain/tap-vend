
module Models
  class OutletTax < Base
    schema do
      string :id
    end

    def transform
      super.tap do |hash|
        hash.merge!(
          'id' =>
             hash.slice('outlet_id', 'product_id', 'tax_id').values.join('.')
        )
      end
    end
  end
end
