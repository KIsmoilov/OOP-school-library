require_relative '../Decorator/trimmer_decorator'
require_relative '../Decorator/capitalize_decorator'
require_relative '../Decorator/base_decorator'
require_relative '../Decorator/nameable'
require_relative '../person'

describe BaseDecorator do
  before :each do
    @person = Person.new(111, 8, 'Maxim Milanus')
    @base_decorator = BaseDecorator.new(@person)
  end
  context 'Unit test for person' do
    it 'should have the correct name' do
      expect(@base_decorator.correct_name).to eql('Maxim Milanus')
    end
  end
end

describe TrimmerDecorator do
  before :each do
    @person = Person.new(111, 8, 'Maximilianus')
    @trimmer_decorator = TrimmerDecorator.new(@person)
  end
  context 'Unit test for person' do
    it 'should have the correct name' do
      expect(@trimmer_decorator.correct_name).to eql('Maximilian')
    end
  end
end

describe CapitalizeDecorator do
  before :each do
    @person = Person.new(111, 8, 'john')
    @capitalize_decorator = CapitalizeDecorator.new(@person)
  end
  context 'Unit test for person' do
    it 'should have the correct name' do
      expect(@capitalize_decorator.correct_name).to eql('John')
    end
  end
end
