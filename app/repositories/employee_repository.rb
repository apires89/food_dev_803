require "csv"
require_relative "../models/employee"
require_relative "base_repository"

class EmployeeRepository < BaseRepository
  def create_element(row)
    @elements << Employee.new(row)
  end

  def headers
    ["id", "username", "password"]
  end

  def to_csv(element, csv)
    csv << [element.id, element.username, element.password]
  end
end
