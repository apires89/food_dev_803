require_relative "../views/customers_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    # 1 get customer from repo
    customer = @customer_repository.all
    # 2. display in terminal
    @customers_view.display(customer)
  end

  def add
    # Ask user for a name
    name = @customers_view.ask_user_for("name")
    # Ask user for a price
    address = @customers_view.ask_user_for("address")
    # Instantiate customer
    customer = Customer.new(name: name, address: address)
    # Store it in repo
    @customer_repository.create(customer)
  end
end
