require 'date'
require_relative '../src/book'

describe Book do
  context 'testing the Book class' do
    book = Book.new('good', 'Taleb', Date.parse('2023-09-13'))

    it 'has a publisher' do
      expect(book.publisher).to eq('Taleb')
    end

    it 'has a cover state' do
      expect(book.cover_state).to eq('good')
    end

    it 'has a publish_date' do
      expect(book.publish_date).to eq(Date.parse('2023-09-13'))
    end
  end

  describe 'can_be_archived?' do
    it 'should return true' do
      book = Book.new('Bed of Procustees', 'Nassim Taleb', Date.parse('2003-01-01'))
      expect(book.send(:can_be_archived?)).to be true
    end
  end

  describe 'can_be_archived?' do
    it 'should return false' do
      book = Book.new('good', 'Wyclife Jennings', Date.parse('2021-01-01'))
      expect(book.send(:can_be_archived?)).to be false
    end
  end
end
