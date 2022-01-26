class Order
  attr_accessor :id, :employee
  attr_reader :customer, :meal

  def initialize(attributes = {})
    @customer = attributes[:customer]
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
    @id = attributes[:id]
  end

  def delivered?
    @delivered
  end


  def deliver!
    @delivered = true
  end
end
