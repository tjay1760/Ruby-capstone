require_relative 'book'
require_relative 'label'

class InputData
  def initialize()
    @books = []
  end

  def book_year
    puts 'Enter Publication Year: '
    year = gets.chomp.to_i
    while year < 1 || year > Time.now.year
      puts 'Please enter valid year'
      year = gets.chomp.to_i
    end
    year
  end

  def add_book
    puts "Input book's information"
    label = label_details
    book = book_details
    new_book = Book.new(book[0], book[1], book[2])
    new_label = Label.new(label[0], label[1])
    new_label.add_item(new_book)
    puts 'The book was created successfully!'
    new_book
  end

  def label_details
    print 'Enter Title of the Book: '
    label_title = gets.chomp
    print 'Color of the Book: '
    label_color = gets.chomp
    [label_title, label_color]
  end

  def book_details
    print 'Publisher Name:'
    publisher = gets.chomp
    book_date = book_year
    print "What's the cover state of the book? [good/bad] "
    cover_state = gets.chomp.downcase
    [cover_state, publisher, book_date]
  end
end
