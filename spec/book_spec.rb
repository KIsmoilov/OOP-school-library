require_relative '../book'
require_relative '../person'

describe Book do
  before :each do
    @book = Book.new('Redeeming Love', 'Francine Rivers')
  end

  context 'Unit test for book class' do
    it 'should have a title and author' do
      title = @book.title
      expect(title).to eq 'Redeeming Love'
      author = @book.author
      expect(author).to eq 'Francine Rivers'
    end

    it 'should add rental to the book and person' do
      @book.add_rental(Person.new('Khusniddin', 28), '2023/01/01')
      expect(@book.rentals.length).to eq 1
    end
  end
end
