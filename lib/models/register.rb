
module Models
  class Register < Base
    schema do
      string :id
      string :name
      string :outlet_id
      string :invoice_prefix
      string :invoice_suffix
    end

    def transform
      super.tap do |hash|
        hash.delete 'attributes'
      end
    end
  end
end
