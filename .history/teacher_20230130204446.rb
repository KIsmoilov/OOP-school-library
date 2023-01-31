require './person'

class Teacher < Person
  def initialize(specialization)
    super()
    @specialization = specialization
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
