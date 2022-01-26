require_relative "../views/orders_view"
require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/sessions_view"
require "byebug"

class OrdersController
  def initialize(order_repository,meal_repository,customer_repository,employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new

  end

  def list_undelivered_orders
    #1. Get undelivered orders (orders repo)
    orders = @order_repository.list_undelivered_orders
    # 2. Display orders (view)
    @orders_view.display(orders)
  end

  def add
    # 1. Get meals

    # 2.Display meals

    # 3. Ask user for index
    @meals_view.display(@meal_repository.all)
    index = @meals_view.ask_user_for("index").to_i - 1
    meal = @meal_repository.all[index]

    #4. get customers
    #5. display customers
    #6. Ask user for index
    @customers_view.display(@customer_repository.all)
    index = @customers_view.ask_user_for("index").to_i - 1
    customer = @customer_repository.all[index]

    #7. get riders
    #8. display riders
    #9. Ask user for index
    @sessions_view.display(@employee_repository.all)
    index = @sessions_view.ask_user_for("index").to_i - 1
    employee = @employee_repository.all[index]

    # 10. Instantiate order
    order = Order.new(meal: meal, customer: customer, employee: employee)
    # 11. Add it to repository
    @order_repository.create(order)

  end

  def riders_undelivered_orders(current_user)
    # 1. Get current user undelivered orders
    my_und_orders = @order_repository.list_my_undelivered_orders(current_user)
    # 2. display in the terminal
    @orders_view.display(my_und_orders)
  end

  def mark_as_delivered(current_user)
    riders_undelivered_orders(current_user)
    index = @orders_view.ask_user_for("index").to_i - 1
    my_orders = @order_repository.list_my_undelivered_orders(current_user)
    order = my_orders[index]
    @order_repository.mark_as_delivered(order)
  end
end
