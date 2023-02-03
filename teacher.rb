require_relative './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services??
    true
  end
end

teacher = Teacher.new('Web', 25, 'Khusniddin')
result = teacher.can_use_services?
puts result