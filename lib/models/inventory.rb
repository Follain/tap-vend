
module Models
  class Inventory < Base
    def self.path
      'inventory'
    end

    schema do
      string :id
    end
  end
end
