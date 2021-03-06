class OrdersView

  def ask_for_index
    puts "Which would you like to add?"
    gets.chomp.to_i - 1
  end

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.employee.username} to deliver #{order.meal.name} to #{order.customer.name}"
    end
  end
end
