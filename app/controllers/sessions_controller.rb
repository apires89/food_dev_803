require_relative "../views/sessions_view"
require "byebug"

class SessionsController
  def initialize(employee_repository)
    @sessions_view = SessionsView.new
    @employee_repository = employee_repository
  end

  def login
    username = @sessions_view.ask_user_for(:username)
    password = @sessions_view.ask_user_for(:password)
    employee = @employee_repository.find_by_username(username)
    return employee if employee && employee.password == password
    @sessions_view.print_wrong_credentials
    login
  end
end
