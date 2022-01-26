class BaseView
  def display(elements)
    elements.each_with_index do |element, index|
      print_element(element, index)
    end
  end

  def ask_user_for(input)
    puts "What is the #{input}?"
    gets.chomp
  end
end
