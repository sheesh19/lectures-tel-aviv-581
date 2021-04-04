class SessionsView

  def ask_for(item)
    puts "What is your #{item}?"
    gets.chomp
  end

  def print_wrong_credentials
    puts "Wrong credentials... try again!"
  end
end
