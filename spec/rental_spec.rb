require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  before :each do
    @book = Book.new('JS', 'David')
    @person = Person.new(701, 22, 'Dan')
    @rental = Rental.new('2023/01/01', @book, @person)
  end

  context 'Unit test for student' do
    it 'should have the correct properties for rental' do
      expect(@rental.date).to eql('2023/01/01')
      expect(@rental.person.name).to eql('Dan')
      expect(@rental.book.author).to eql('David')
    end
  end
end
