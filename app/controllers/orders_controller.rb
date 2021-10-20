require_relative "../views/meals_view.rb"
require_relative "../views/customers_view.rb"
require_relative "../views/employees_view.rb"
require_relative "../views/orders_view.rb"
require_relative "../models/order.rb"


class OrdersController
    def initialize(meal_repository, customer_repository, employee_repository, order_repository)
        @meal_repository = meal_repository
        @meals_view = MealsView.new

        @customer_repository = customer_repository
        @customers_view = CustomersView.new

        @employee_repository = employee_repository
        @employees_view = EmployeesView.new

        @order_repository = order_repository
        @orders_view = OrdersView.new               
    end

    def list_undelivered_orders
        # Il demande au repo la liste des commande undelivered
        # il demande à la vue de les afficher
        undelivered_orders = @order_repository.undelivered_orders
        @orders_view.display_list(undelivered_orders)
    end

    def add
        # Demander au repo de meal la liste des meals
        # Demander à la vue d'afficher la liste meals avec l'index
        # Demander à la vue de choisir un index dans la liste
        # Retrouver le meal dans la liste à partir de son index
        meals = @meal_repository.all
        @meals_view.display_list(meals)
        meal_index = @meals_view.ask_for("Index?").to_i - 1
        meal = meals[meal_index]
        # Demander au repo de customer la liste des customers
        # Demander à la vue d'afficher la liste customers avec l'index
        # Demander à la vue de choisir un index dans la liste
        # Retrouver le customer dans la liste à partir de son index
        customers = @customer_repository.all
        @customers_view.display_list(customers)
        customer_index = @customers_view.ask_for("Index?").to_i - 1
        customer = customers[customer_index]

        # Demander au repo deemployee la liste desemployees
        # Demander à la vue d'afficher la listeemployees avec l'index
        # Demander à la vue de choisir un index dans la liste
        # Retrouver leemployee dans la liste à partir de son index        
        employees = @employee_repository.all_riders
        @employees_view.display_list(employees)
        employee_index = @employees_view.ask_for("Index?").to_i - 1
        employee = employees[employee_index]

        # Demander au model Order de creer une instance de order
        # Demander au repo de order de l'ajouter au tableau
        order = Order.new(meal: meal, customer: customer, employee: employee)
        @order_repository.create(order)

    end

    def list_my_orders(employee)
        # demander au repo de selection my undelivered orders a partir de l'employee
        # demander à la vue
        my_undelivered_orders = @order_repository.my_undelivered_orders(employee)
        @orders_view.display_list(my_undelivered_orders)

    end

    def mark_as_delivered(employee)
        my_undelivered_orders = @order_repository.my_undelivered_orders(employee)
        @orders_view.display_list(my_undelivered_orders)
        
        order_index = @orders_view.ask_for("index?").to_i - 1
        order = my_undelivered_orders[order_index]
        order.deliver!
        @order_repository.save
    end
end