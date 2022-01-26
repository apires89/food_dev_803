require "csv"
require_relative "../models/customer"
require_relative "base_repository"

class CustomerRepository < BaseRepository
  def create_element(row)
    @elements << Customer.new(row)
  end

  def headers
    ["id", "name", "address"]
  end

  def to_csv(element, csv)
    csv << [element.id, element.name, element.address]
  end
end
