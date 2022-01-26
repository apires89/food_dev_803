require_relative "base_view"
class SessionsView < BaseView
  def print_element(element, index)
    puts "#{index + 1} - #{element.username} - #{element.role} "
  end

  def print_wrong_credentials
    puts "Wrong credentials... Try again"
  end
end
