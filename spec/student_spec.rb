require_relative '../student'
require_relative '../classroom'

describe Student do
  before :each do
    @student = Student.new(777, 38, 'Front', 'Andy')
  end

  context 'Unit test for student' do
    it 'should have the correct properties for student' do
      expect(@student.id).to eql(777)
      expect(@student.age).to eql(38)
      expect(@student.classroom.label).to eql('Front')
      expect(@student.name).to eql('Andy')
    end

    it "it should return '¯(ツ)/¯'" do
      expect(@student.play_hooky).to eq '¯(ツ)/¯'
    end
  end
end
