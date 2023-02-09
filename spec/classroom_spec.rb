require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :all do
    @classroom = Classroom.new('label_2')
  end

  context 'Unit test for classroom' do
    it 'should have the label label_1' do
      label = @classroom.label
      expect(label).to eql 'label_2'
    end

    it 'should add a student to the classroom' do
      student = Student.new(101, 18, true, 'student_name')
      @classroom.add_students(student)
      expect(student.classroom.label).to eq 'label_2'
    end
  end
end
