class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      route_user_action
    end
  end

  private

  def route_user_action
    print_user_menu
    choice = gets.chomp.to_i
    user_action(choice)
  end

  def print_user_menu
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List all meals"
    puts "2- Add a meal"
    puts "3 - List all customers"
    puts "4- Add a Customer"
    puts "7- Log out"
    puts "9 - Quit"
    print "> "
  end

  def user_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then stop!
    else
      puts "Try again..."
    end
  end

  def stop!
    @running = false
  end
end
