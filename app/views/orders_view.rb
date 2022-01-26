require_relative "base_view"

class OrdersView < BaseView
  def print_element(element, index)
    delivered = element.delivered? ? "[ X ]" : "[  ]"
    puts "#{delivered} - #{index + 1} - #{element.meal.name} - #{element.customer.name} - #{element.employee.username} "
  end
end
