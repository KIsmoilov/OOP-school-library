require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(111, 8, 'Eli')
  end
  context 'Unit test for person' do
    it 'should have the correct properties for person' do
      expect(@person.id).to eql(111)
      expect(@person.age).to eql(8)
      expect(@person.name).to eql('Eli')
    end

    it 'can use services should return true' do
      @person1 = Person.new(701, 25, 'John')
      expect(@person1.can_use_services?).to be true
    end

    it 'should return the total number of rentals' do
      @person.add_rental('2023/01/01', Book.new('Ruby', 'John Doe'))
      @person.add_rental('2023/01/01', Book.new('Ruby', 'John Doe'))
      expect(@person.rentals.length).to eql 2
    end
  end
end
