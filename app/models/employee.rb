class Employee
  attr_accessor :id
  attr_reader :username, :password, :role, :orders

  def initialize(attributes = {})
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
    @orders = []
    @id = attributes[:id]
  end

  def manager?
    @role == "manager"
  end

  def rider?
    @role == "rider"
  end

  def add_order(order)
    @orders << order
    order.employee = self
  end





end
