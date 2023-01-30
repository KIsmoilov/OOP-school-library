class Person
    def initialize(type, number_of_legs, name = 'Unknown')
      @id = Random.rand(1..1000)
      @name = name
      @age = age
    end
  
    def speak
      "grrrr"
    end
  
    attr_accessor :name, :age
    attr_reader :id
  end