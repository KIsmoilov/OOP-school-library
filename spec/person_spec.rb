require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(8, 'Eli')
  end
  context 'Unit test for person' do
    it 'should have the correct properties for person' do
      expect(@person.name).to eql('Eli')
      expect(@person.age).to eql(8)
    end
  end
end
