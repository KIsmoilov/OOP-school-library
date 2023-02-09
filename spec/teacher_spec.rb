require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(808, 25, nil, 'Husniddin')
  end

  context 'Unit test for teacher' do
    it 'should have the properties of teacher' do
      expect(@teacher.id).to eql 808
      expect(@teacher.age).to eql 25
      expect(@teacher.name).to eql 'Husniddin'
    end

    it 'can use services should return true' do
      expect(@teacher.can_use_services?).to eql true
    end
  end
end
