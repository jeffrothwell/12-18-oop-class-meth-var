require "pp"
class Book
  @@on_shelf = []
  @@on_loan = []

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @due_date = 0
    @borrowed = false
  end

  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    # @book = new_book
    return new_book
  end

  def due_date
    @due_date
  end

  def due_date=(date)
    @due_date = date
  end

  def borrow
    if lent_out?
      return false
    else
      @@on_loan << self
      @@on_shelf.delete(self)
      self.due_date = self.class.current_due_date
      return true
    end
  end

  def return_to_library
    if lent_out? == false
      return false
    else
      @@on_shelf << self
      @@on_loan.delete(self)
      self.due_date = nil
      return true
    end
  end

  def lent_out?
    @@on_shelf.each do |book|
      if book == self
        return false
      end
    end
    return true
  end

  def self.current_due_date
    Time.now + 604800
  end

  def self.overdue_books
    overdue = []
    @@on_loan.each do |book|
      if book.due_date < Time.now
        overdue << book
      end
    end
    return overdue
  end

  def self.browse
    @@on_shelf.sample
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

end

slapstick = Book.create("Slapstick", "Kurt Vonnegut", 18746)
grapes_of_wrath = Book.create("The Grapes of Wrath",
  "John Steinbeck", 14642)
on_the_road = Book.create("On The Road", "Jack Kerouac", 15130)

puts "Browse the books a couple of times"
pp Book.browse
pp Book.browse

puts "Is slapstick lent out?"
pp slapstick.lent_out?

puts "I will borow slapstick"
slapstick.borrow

puts "Is slapstick lent out NOW?"
pp slapstick.lent_out?
puts "what is now borrowed?"
pp Book.borrowed
puts "what is now available?"
pp Book.available

# no books are overdue because I set the due date to a week
# from now.  however, to test it I changed the current_due_date
# class method to make the due date a week ago, ran the program
# again and it showed me slapstick was overdue.
puts "which books are overdue?"
pp Book.overdue_books

puts "Now returning Slapstick"
slapstick.return_to_library
puts "what is now borrowed?"
pp Book.borrowed
puts "what is now available?"
pp Book.available
