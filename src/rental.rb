class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date)
    @date = date
    @book = book
    book.add_rental(self)
    @person = person
    person.add_rental(self)
  end
end
