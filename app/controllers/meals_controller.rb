require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # 1 get meals from repo
    meals = @meal_repository.all
    # 2. display in terminal
    @meals_view.display(meals)
  end

  def add
    # Ask user for a name
    name = @meals_view.ask_user_for("name")
    # Ask user for a price
    price = @meals_view.ask_user_for("price").to_i
    # Instantiate meal
    meal = Meal.new(name: name, price: price)
    # Store it in repo
    @meal_repository.create(meal)
  end
end
