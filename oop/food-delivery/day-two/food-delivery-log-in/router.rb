class Router

  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      # login first => call the sessions_controller
      @current_user = @sessions_controller.login
      while @current_user
        if @current_user.manager?
          route_manager_actions
        else
          route_rider_actions
        end
      end

    end
  end

  private

  def route_manager_actions
    display_manager_tasks
    action = gets.chomp.to_i
    print `clear`
    manager_action(action)
  end

  def route_rider_actions
    display_rider_tasks
    action = gets.chomp.to_i
    print `clear`
    rider_action(action)
  end

  def display_manager_tasks
    puts "--------------------"
    puts "1. List all meals"
    puts "2. Create a new meal"
    puts "3. List all customers"
    puts "4. Create a new customer"
    puts "5. Logout"
    puts "6. Exit"
    puts "--------------------"
  end

  def manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then logout!
    when 6 then stop!
    else puts "Please put a valid number"
    end
  end

  def display_rider_tasks
    puts "--------------------"
    puts "1. List all undelivered orders"
    puts "2. Mark as completed"
    puts "3. Logout"
    puts "4. Exit"
    puts "--------------------"
  end

  def rider_action(action)
    case action
    when 1 then puts "TODO: list out orders"
    when 2 then puts "TODO: mark order as complete"
    when 3 then logout!
    when 4 then stop!
    else puts "Please put a valid number"
    end
  end

  def stop!
    logout!
    @running = false
  end

  def logout!
    # stops our while @current_user condition
    @current_user = nil
  end
end
