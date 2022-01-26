require_relative "base_view"
class SessionsView < BaseView
  def print_wrong_credentials
    puts "Wrong credentials... Try again"
  end
end
