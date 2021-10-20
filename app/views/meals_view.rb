require_relative "base_view.rb"

class MealsView < BaseView

    def display_list(meals)
        meals.each_with_index do |meal, index|
            puts "#{index + 1} - #{meal.name} : #{meal.price} €"
        end
    end

end