class Book

  @@on_shelf=[]
  @@on_loan=[]
  @@overdue=[]

  def initialize(title, author, isbn)
    @book_title = title
    @book_author = author
    @book_isbn = isbn
    @due_date = nil
    @hold = nil
  end

  def borrow
    if lent_out?
      return false
    else
      due_date
      @@on_loan << self
      @@on_shelf.delete(self)
      return true
    end
  end

  def due_date
    @due_date = Time.now + (60*60*24*3)
    return @due_date
  end

  # def due=(due)
  #    @due_date = due
  # end

  def lent_out?
    p "==================================="
    p @@on_shelf
    @@on_shelf.each do |book|
      if book == self
        # @@on_loan << self
        # @@on_shelf.delete(self)
        return false
      else
        return true
      end
    end
  end

  def return_to_library
    if lent_out?
      @@on_shelf << self
      @@on_loan.delete(self)
      @due_date = nil

      return true
    else
      return false
    end
  end

def someone
  @@on_loan.each do |book|
    if book == self
      puts "#{self.inspect} is already on loan"
    else
      puts "let's go borrow book !"
    end
  end
end

def hold(status)
  @hold = status
  if @hold == false
    puts "you can renew ! lucky!"
  else
    puts "you cant renew. sorry!"
  end
end

  def renew
    @due_date = due_date + (60*60*24*7)
    return @due_date
  end

  def self.overdue
    @@overdue
  end
  def self.on_shelf
    @@on_shelf

  end
  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    return new_book
  end

  def self.on_shelf
    @@on_shelf
  end

  def self.current_due_date
    return Time.now
  end

  def self.overdue_books
    @@on_loan.each do |due|
      if due.due_date < Book.current_due_date
          @@overdue << due.due_date
      end
    end
  end

  def self.browse
    return @@on_shelf.sample
  end

  def self.available
    return @@on_shelf
  end

  def self.borrowed
    return @@on_loan
  end

end

my_book=Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
your_book=Book.create("Ain't I a woman?", "Bell Hooks", "9780896081307")
gina_book=Book.create("if they come in the morning", "Angela Y. Davis", "0893880221")
#puts my_book.inspect
#puts your_book.inspect
puts Book.browse.inspect
puts Book.browse.inspect
puts Book.browse.inspect
puts '==========Available'
puts Book.available.inspect
puts '==========Borrowed book (on_loan)'
puts Book.borrowed.inspect
puts '==========mybook "Sister Outsider"'
p my_book.lent_out?
puts "$%$%$$%{$%{$%{}}}}"
p my_book.borrow
puts '=========mybook "borrowed Sister Outsider"'
p Book.available
# puts '=========Check What books are available'
# p my_book.lent_out?
# puts '=========someone already borrowed'
# p my_book.borrow
puts "=========someone cant borrow"
p my_book.due_date.inspect
#
# puts '==========Sister Outsider due_date'
# p Book.available
# puts "==========check out what books are available now"

puts "+++++++++++Borrowed book list"
p Book.borrowed.inspect
# # p Book.overdue_books
# puts "there is nothing over duedate Good !!!!!"
# p Book.overdue
# puts "I want to return Sister outsider (true)"
# p my_book.return_to_library
# puts "now  Sister Outsider is available (false) "
# p my_book.lent_out?
#
# p Book.available

puts "+++++++++++"
p my_book.someone
p my_book.hold(false)
p my_book.renew
p my_book
