require_relative "../models/customer.rb"
require_relative "base_repository.rb"

class CustomerRepository < BaseRepository

    private

    def csv_headers
        ['id', 'name', 'address']
    end

    def define_element(row)
        id = row[:id].to_i
        name = row[:name]
        address = row[:address]
        Customer.new(id: id, name: name, address: address)    
    end

end