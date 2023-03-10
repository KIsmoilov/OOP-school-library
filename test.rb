require_relative './person'
require_relative './classroom'
require_relative './Decorator/nameable'
require_relative './Decorator/capitalize_decorator'
require_relative './Decorator/base_decorator'
require_relative './Decorator/trimmer_decorator'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name
