class Order
    attr_accessor :id
    attr_reader :meal, :customer, :employee
    
    def initialize(attrs={})
        @id = attrs[:id]
        @delivered = attrs[:delivered] || false
        @meal = attrs[:meal]
        @customer = attrs[:customer]
        @employee = attrs[:employee]
    end

    def delivered?
        @delivered
    end

    def deliver!
        @delivered = true
    end

    def csv_fields
        [ @id, @delivered, @meal.id, @customer.id, @employee.id ]
    end
end
