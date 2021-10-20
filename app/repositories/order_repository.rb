require_relative "../models/order.rb"
require_relative "base_repository.rb"

class OrderRepository < BaseRepository

    def initialize(csv_file, meal_repository, customer_repository, employee_repository)
        @meal_repository = meal_repository
        @customer_repository = customer_repository
        @employee_repository = employee_repository
        super(csv_file)
        # @elements = []
        # @next_id = 1
        # @csv_file = csv_file 
        # load_csv if File.exist?(@csv_file)
    end

    def undelivered_orders
        @elements.select { |element| !element.delivered? }
        # @elements.reject { |element| element.delivered? } 
    end

    def my_undelivered_orders(employee)
        @elements.select { |element| !element.delivered? && element.employee == employee }
    end   

    def save
        save_csv
    end
    
    private

    def csv_headers
        ['id', 'delivered' ,'meal_id', 'customer_id', 'employee_id']
    end

    def define_element(row)

        # 1ere fois 
        # row  = {id:"1" delivered:"true" meal_id:"1" customer_id:"1" employee_id:"2"}
        id = row[:id].to_i
        delivered = row[:delivered] == "true" 
        meal_id = row[:meal_id].to_i
        meal = @meal_repository.find(meal_id) 
        customer_id = row[:customer_id].to_i
        customer = @customer_repository.find(customer_id) 
        employee_id = row[:employee_id].to_i
        employee = @employee_repository.find(employee_id) 

        attributes = {
            id: id,
            delivered: delivered,
            meal: meal,
            customer: customer,
            employee: employee

        }
        Order.new(attributes)
    end
end