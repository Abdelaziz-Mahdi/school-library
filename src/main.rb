require_relative 'app'

options_descriptions = {
  1 => 'List all books',
  2 => 'List all people',
  3 => 'Create a person',
  4 => 'Create a book',
  5 => 'Create a rental',
  6 => 'List all rentals for a given person id',
  0 => 'Exit'
}

def main(options_descriptions)
  app = App.new

  options = {
    1 => -> { app.list_books },
    2 => -> { app.list_people },
    3 => -> { app.create_person },
    4 => -> { app.create_book },
    5 => -> { app.create_rental },
    6 => -> { app.list_rentals },
    0 => -> { puts 'Exiting...' }
  }

  loop do
    display_menu(options_descriptions)
    option = gets.chomp.to_i
    if options.key?(option)
      options[option].call
      break if option.zero?
    else
      puts 'Invalid option. Try again.'
    end
  end
end

def display_menu(options_descriptions)
  puts 'Welcome to School Library App!'
  puts 'What do you want to do?'

  options_descriptions.each do |key, description|
    puts "#{key}. #{description}"
  end

  print '> '
end

main(options_descriptions)
