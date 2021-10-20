require_relative "base_view.rb"

class OrdersView < BaseView

    def display_list(orders)
        orders.each_with_index do |order, index|
            cross = order.delivered? ? "[X]" : "[ ]"
            puts "#{index + 1} - #{cross}  #{order.meal.name} - #{order.customer.name} - #{order.employee.username}"
        end
    end

end