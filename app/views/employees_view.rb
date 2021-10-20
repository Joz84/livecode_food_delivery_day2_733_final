require_relative "base_view.rb"

class EmployeesView < BaseView

    def display_list(employees)
        employees.each_with_index do |employee, index|
            puts "#{index + 1} - #{employee.username}"
        end
    end

end