class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(person, date, self)
    @rentals << rental
  end
  attr_accessor :title, :author
  attr_reader :rentals
end
