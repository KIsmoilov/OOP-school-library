require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './classroom'
require_relative './store_data/preserve_books'
require_relative './store_data/preserve_people'


class App
  attr_accessor :books, :people, :rentals, :classroom

  def initialize
    @books = fetch_books
    @people = fetch_people
    @rentals = []
    @classroom = Classroom.new('Web Development')
  end

  include BooksPreserve
  include PeoplePreserve

  def menu
    puts "\n\nWelcome to School library app"
    puts "\n1 - List all books"
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def check(options)
    case options
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    end
  end

  def execute
    choice = 0
    while choice != 7
      menu
      puts
      puts
      print '[Enter 1-7]: '
      choice = gets.chomp.strip.to_i
      check(choice)
      puts
      puts
    end
    puts 'Thank you for using School library app!'
    store_books(@books)
    store_people(@people)
  end

  def list_all_books
    if @books.empty?
      puts 'Book has not been added yet, please create a book'
    else
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'Person has not been added yet, please create a person'
    else
      @people.each do |person|
        puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def get_user_input(message)
    puts message
    gets.chomp.to_i
  end

  def get_user_input_string(message)
    puts message
    gets.chomp.to_s
  end

  def create_person
    person_type = get_user_input('Do you want to create a student (1) or a teacher (2)? [Input a number]:')

    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      invalid_input
    end
  end

  def create_student
    age = get_user_input('Age:')
    name = get_user_input_string('Name:')
    parent_permission = get_user_input_string('Has parent permission? [Y/N]:')
    case parent_permission.capitalize
    when 'Y'
      permission = true
    when 'N'
      permission = false
    else
      return invalid_input
    end

    people.push(Student.new(classroom, age, name, parent_permission: permission))
    puts 'Person created successfully'
  end

  def create_teacher
    specialization = get_user_input_string('Specialization:')
    age = get_user_input('Age:')
    name = get_user_input_string('Name:')

    people.push(Teacher.new(specialization, age, name))
    puts 'Person created successfully'
  end

  def create_book
    title = get_user_input_string('Title:')
    author = get_user_input_string('Author:')

    books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title} Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    return invalid_input if book_index > books.length

    puts 'Select a person from the following list by number (not id): '
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    return invalid_input if person_index > people.length

    print 'Date: '
    date = gets.chomp.to_s

    rentals.push(Rental.new(date, people[person_index], books[book_index]))
    puts 'Rental created successfully.'
  end

  def display_rentals_by_person_id
    if @rentals.empty?
      puts 'Rental has not been registered yet'
    else
      print 'Person ID: '
      person_id = gets.chomp.to_i
      rentals.each do |rent|
        puts "Date: #{rent.date}, Book: #{rent.book.title} by #{rent.book.author}." if rent.person.id == person_id
      end
    end
  end

  def invalid_input
    puts 'Invalid Input'
  end
end
