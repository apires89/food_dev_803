class Employee
  attr_accessor :id
  attr_reader :username, :password

  def initialize(attributes = {})
    @name = attributes[:username]
    @address = attributes[:password]
    @id = attributes[:id]
  end
end
