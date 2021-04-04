require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../views/sessions_view'

class OrdersController

  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
  end

  def add
    meal = select_meal # => instance of meal
    customer = select_customer
    employee = select_employee
    # create our order instance
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @orders_view.display(undelivered_orders)
  end

  def list_my_orders(current_user)
    list_my_undelivered_orders(current_user)
  end

  def mark_as_delivered(current_user)
    list_my_undelivered_orders(current_user)
    index = @orders_view.ask_for_index
    # return the array of MY undelivered orders
    my_undelivered_orders = @order_repository.my_undelivered_orders(current_user)
    # use the index + array of undelivered orders to return an instance
    order = my_undelivered_orders[index]
    # pass the instance to our repository to update the status
    @order_repository.mark_as_delivered(order)
  end

  private


  def list_my_undelivered_orders(current_user)
    my_undelivered_orders = @order_repository.my_undelivered_orders(current_user)
    @orders_view.display(my_undelivered_orders)
  end

  # refactored our add steps into several methods

  def select_meal
    # display meal array
    # ask user for meal index
    meals = @meal_repository.all
    @meals_view.display(meals)
    index = @orders_view.ask_for_index
    meals[index] # => instance of meal
  end

  def select_customer
    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @orders_view.ask_for_index
    customers[index]
  end

  def select_employee
    # display only rider / delivery people to assign orders to
    employees = @employee_repository.all_riders
    @sessions_view.display(employees)
    index = @orders_view.ask_for_index
    employees[index]
  end
end
