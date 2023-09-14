require_relative 'book'
require_relative 'label'
require 'json'

class BookSaver
  def initialize(books)
    @books = books
  end

  def parse_books
    return [] unless File.exist?('./books.json')

    books_file = File.open('./books.json')
    data = JSON.parse(books_file.read)
    books_file.close
    data.map do |book|
      new_book = Book.new(book['cover_state'], book['publisher'], book['publish_date'], book['id'])
      new_label = Label.new(book['label']['title'], book['label']['color'], book['label']['id'])
      new_label.add_item(new_book)
      new_book
    end
  end

  def save_books
    existing_data = []
    @books.each do |book|
      existing_data << {
        publish_date: book.publish_date,
        cover_state: book.cover_state,
        publisher: book.publisher,
        id: book.id,
        label: {
          title: book.label.title,
          id: book.label.id,
          color: book.label.color
        }

      }
    end
    File.write('./books.json', JSON.pretty_generate(existing_data))
  end
end
