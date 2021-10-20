require_relative "../models/employee.rb"
require_relative "base_repository.rb"

class EmployeeRepository < BaseRepository
    undef_method :create
    
    def find_by_username(username)
        @elements.find { |element| element.username == username }
    end

    def all_riders
        @elements.select { |element| element.rider? }
    end
    
    private

    def csv_headers
        ['id', 'username', 'password', 'role']
    end

    def define_element(row)
        row[:id] = row[:id].to_i
        Employee.new(row)    
    end

end