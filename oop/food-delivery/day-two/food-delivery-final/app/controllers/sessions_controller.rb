require_relative '../views/sessions_view'

class SessionsController

  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    # ask for username
    # ask for password
    # find the employee based on their username
    # check if the password matches
    # check if the employee exists
    # else, print out wrong credentials line

    username = @sessions_view.ask_for(:username)
    password = @sessions_view.ask_for(:password)
    employee = @employee_repository.find_by_username(username)

    return employee if employee && employee.password == password

    @sessions_view.print_wrong_credentials
    login
  end
end
