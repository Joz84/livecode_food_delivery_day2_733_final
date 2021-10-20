# - [x] As a manager I can list all meals
# - [x] As a manager I can add a meal
# - [x] As a manager I can list all customers
# - [x] As a manager I can add a customer
# - [ ] As a manager I can list undelivered orders
# - [ ] As a manager I can add an order

# - [ ] As a rider I can list my undelivered orders
# - [ ] As a rider I can mark an order as delivered

class Router
    def initialize(sessions_controller, meals_controller, customers_controller, orders_controller)
        @running = true
        @sessions_controller = sessions_controller
        @meals_controller = meals_controller
        @customers_controller = customers_controller
        @orders_controller = orders_controller
    end

    def run

        @employee = @sessions_controller.login
        if @employee.rider?
            rider_menu
        else
            manager_menu
        end

    end

    def manager_menu
        while @running
            puts "Welcome"
            puts "0 - quit"
            puts "1 - List meals"
            puts "2 - Create a meal"
            puts "3 - List customers"
            puts "4 - Create a customer"
            puts "5 - List undelivered orders"
            puts "6 - Add an order"

            puts "Your choice?"
            print "> "
            choice = gets.chomp.to_i

            case choice
            when 0 then @running = false
            when 1 then @meals_controller.list
            when 2 then @meals_controller.add
            when 3 then @customers_controller.list
            when 4 then @customers_controller.add
            when 5 then @orders_controller.list_undelivered_orders
            when 6 then @orders_controller.add                
            else
                puts "Tes un gros naze!"
            end
        end
    end

    def rider_menu
        while @running
            puts "Welcome"
            puts "0 - quit"
            puts "1 - List my undelivered orders"
            puts "2 - Mark an order as delivered"

            puts "Your choice?"
            print "> "
            choice = gets.chomp.to_i

            case choice
            when 0 then @running = false
            when 1 then @orders_controller.list_my_orders(@employee)
            when 2 then @orders_controller.mark_as_delivered(@employee)             
            else
                puts "Tes un gros naze!"
            end
        end
    end


end

