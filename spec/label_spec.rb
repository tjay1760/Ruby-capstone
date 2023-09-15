require_relative '../src/book'
require_relative '../src/label'

describe Label do
  context 'Testing label class' do
    before(:each) do
      @label = Label.new('Book-label', 'Red')
      @new_book = Book.new('cover', 'William Morrow', 1954)
    end

    it 'has the label title' do
      expect(@label.title).to eq 'Book-label'
    end

    it 'add book item object to label items array' do
      @label.add_item(@new_book)
      expect(@label.items[0]).to eq @new_book
    end

    it 'The Label class method should return 1' do
      @label.add_item(@new_book)
      expect(@label.items.length).to eql 1
    end

    it 'has the label title' do
      expect(@label.color).to eq 'Red'
    end

    # Adding the new test cases for the add_item method
    describe '#add_item' do
      it "should add the item to the label's items list" do
        @label.add_item(@new_book)
        expect(@label.items).to include(@new_book)
      end

      it "should set the item's label to the current label" do
        @label.add_item(@new_book)
        expect(@new_book.label).to eq(@label)
      end
    end
  end
end
