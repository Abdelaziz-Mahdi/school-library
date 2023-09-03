require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'person'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'No books available'
    else
      @books.each_with_index do |book, index|
        puts "#{index}): #{book.title} by #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'No people available'
    else
      @people.each_with_index do |person, index|
        puts "#{index}): (#{person.class}) Name #{person.name} Age #{person.age}"
      end
    end
  end

  def create_student
    puts 'Whats the name of the student?'
    name = gets.chomp
    puts 'Whats the age of the student?'
    age = gets.chomp.to_i
    puts 'Whats the parent permission of the student? (Y/N)'
    parent_permission = gets.chomp.downcase == 'y'
    classroom = []
    person = Student.new(name, classroom, age, parent_permission: parent_permission)
    @people << person
    puts 'Student created successfully'
  end

  def create_teacher
    puts 'Whats the name of the teacher?'
    name = gets.chomp
    puts 'Whats the specialization of the teacher?'
    specialization = gets.chomp
    puts 'Whats the age of the teacher?'
    age = gets.chomp.to_i
    person = Teacher.new(name, specialization, age)
    @people << person
    puts 'Teacher created successfully'
  end

  def create_person
    puts 'Do you want to create a (1) student or a (2) teacher?'
    person_type = gets.chomp.to_i
    if person_type == 1
      create_student
    elsif person_type == 2
      create_teacher
    else
      puts 'Invalid option. Try again.'
    end
  end

  def create_book
    puts 'Whats the name of the book?'
    title = gets.chomp
    puts 'Who is the author?'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Who wants to rent a book? (insert index)'
    list_people
    person_index = gets.chomp.to_i
    person = @people[person_index]
    puts 'Which book? (insert index)'
    list_books
    book_index = gets.chomp.to_i
    book = @books[book_index]
    puts 'Date: (YYYY-MM-DD)'
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals
    puts 'Who wants to see their rentals? (insert index)'
    list_people
    person_index = gets.chomp.to_i
    person = @people[person_index]
    puts 'Rentals:'
    person.rentals.each do |rental|
      puts "#{rental.book.title} by #{rental.book.author} on #{rental.date}"
    end
  end
end
