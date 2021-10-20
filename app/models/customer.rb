class Customer
    attr_accessor :id
    attr_reader :name, :address
    
    def initialize(attrs={})
        @id = attrs[:id]
        @name = attrs[:name]
        @address = attrs[:address]
    end

    def csv_fields
        [ self.id, self.name, self.address ]
    end
end
