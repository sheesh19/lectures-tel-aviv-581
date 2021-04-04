class SessionsView

  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username} : #{employee.role.upcase}"
    end
  end

  def ask_for(item)
    puts "What is your #{item}?"
    gets.chomp
  end

  def print_wrong_credentials
    puts "Wrong credentials... try again!"
  end
end
