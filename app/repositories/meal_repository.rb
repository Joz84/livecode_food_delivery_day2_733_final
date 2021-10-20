require_relative "../models/meal.rb"
require_relative "base_repository.rb"

class MealRepository < BaseRepository

    private

    def csv_headers
        ['id', 'name', 'price']
    end

    def define_element(row)
        id = row[:id].to_i
        name = row[:name]
        price = row[:price].to_i
        Meal.new(id: id, name: name, price: price)    
    end
end