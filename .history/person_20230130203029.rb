class Person
    def initialize(name = 'Unknown', age, parent_permission = true)
      @id = Random.rand(1..1000)
      @name = name
      @age = age
      @parent_permission = parent_permission
    end

    attr_accessor :name, :age
    attr_reader :id

    def can_use_services?
        if (is_of_age == true or parent_permission == true)
            true
            else  
                false
            end
      end

    private 

    def is_of_age?
        if @age >= 18
          true
        elsif @age < 18
          false
        end
      end 
  end