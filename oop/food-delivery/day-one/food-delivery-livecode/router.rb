class Router

  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def display_tasks
    puts "--------------------"
    puts "1. List all meals"
    puts "2. Create a new meal"
    puts "3. List all customers"
    puts "4. Create a new customer"
    puts "5. Exit"
    puts "--------------------"
  end

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then stop!
    else puts "Please put a valid number"
    end
  end

  def stop!
    @running = false
  end
end
