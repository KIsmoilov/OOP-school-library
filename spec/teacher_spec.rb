require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(25, 'Husniddin')
  end

  context 'Unit test for teacher' do
    it 'should have the properties of teacher' do
      expect(@teacher.age).to eql '25'
      expect(@teacher.name).to eql 'Husniddin'
    end
  end
end
