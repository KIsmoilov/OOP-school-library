require_relative '../student'

describe Student do
  before :each do
    @student = Student.new('Front end development', 38, 'Andy')
  end

  context 'Unit test for student' do
    it 'should have the correct properties for student' do
      expect(@student.name).to eql('Andy')
      expect(@student.classroom).to eql('Front end development')
      expect(@student.age).to eql(38)
    end
  end
end
