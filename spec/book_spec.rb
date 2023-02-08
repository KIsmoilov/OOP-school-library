require_relative '../book'

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
  end
end
