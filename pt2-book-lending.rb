class Book
  @@on_shelf = []
  @@on_loan = []

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @due_date = 0
  end

  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    return new_book
  end

  def due_date
    @due_date
  end

  def due_date=
    @due_date = Time.now + 604800
  end

  def borrow

  end

  def return_to_library

  end

  def lent_out?

  end

end
