require "csv"
require_relative "../models/meal"
require_relative "base_repository"

class MealRepository < BaseRepository
  def create_element(row)
    row[:price] = row[:price].to_i
    @elements << Meal.new(row)
  end

  def headers
    ["id", "name", "price"]
  end

  def to_csv(element, csv)
    csv << [element.id, element.name, element.price]
  end
end
