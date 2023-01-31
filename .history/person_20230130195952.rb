class Person
    def initialize(name = 'Unknown', age, parent_permission = true)
      @id = Random.rand(1..1000)
      @name = name
      @age = age
    end

    attr_accessor :name, :age
    attr_reader :id

    def is_of_age?
        if @age >= 18
          true
        elsif @age < 18
          false
        end
      end
  end