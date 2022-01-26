require "csv"
require_relative "../models/order"
require "byebug"

class OrderRepository
  def initialize(csv_file,meal_repository,customer_repository,employee_repository)
    @csv_file = csv_file
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @orders
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end

  def create(order)
    order.id = @next_id
    @orders << order
    #create relation
    order.employee.add_order(order)
    @next_id += 1
    save_csv
  end

  def list_undelivered_orders
    @orders.reject(&:delivered?)
  end

  def list_my_undelivered_orders(current_user)
    current_user.orders.reject(&:delivered?)
  end


  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end


  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      # convert data
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      # fetch from each repository the correct instance
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      # add it to @orders
      order = Order.new(row)
      @orders << order
      #after order is created we create the employee relation
      row[:employee].add_order(order)
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["id","customer_id","meal_id","employee_id","delivered"]
      @orders.each do |order|
        csv << [order.id,order.customer.id,order.meal.id,order.employee.id,order.delivered?]
      end
    end
  end
end
