
class Citizen
  attr_reader :first_name, :last_name
  attr_writer
  attr_accessor

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def can_vote?
    @age >= 18
  end

  def full_name
    "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

  private

  def fix_name
    puts "FIXED!"
  end
end

citizen = Citizen.new
citizen.fix_name
