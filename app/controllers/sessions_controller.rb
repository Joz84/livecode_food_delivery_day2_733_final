require_relative "../views/sessions_view.rb"
require_relative "../models/employee.rb"

class SessionsController
    def initialize(employee_repository)
        @employee_repository = employee_repository
        @view = SessionsView.new
    end

    def login
        username = @view.ask_for("Username?")
        password = @view.ask_for("Password?")
        employee = @employee_repository.find_by_username(username)
        if employee && employee.password == password
            return employee
        else
            @view.again
            login
        end
    end
end