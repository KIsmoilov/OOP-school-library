require_relative './Decorator/nameable'
require_relative './rental'
require_relative './book'
class Person < Nameable
  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @rentals = []
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    rental = Rental.new(date, self, book)
    @rentals << rental
  end
  private :of_age?
end
