require "csv"

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |meal| meal.id == id }
  end

  def create(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      # convert data
      row[:id] = row[:id].to_i
      create_element(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << headers
      @elements.each do |element|
        to_csv(element, csv)
      end
    end
  end
end
