require_relative "base_view.rb"

class CustomersView < BaseView

    def display_list(customers)
        customers.each_with_index do |customer, index|
            puts "#{index + 1} - #{customer.name} : #{customer.address}"
        end
    end

end