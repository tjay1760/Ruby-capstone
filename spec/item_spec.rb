require_relative '../item'

RSpec.describe Item do
  let(:publish_date) { Date.new(2010, 1, 1) }
  let(:item) { Item.new(publish_date) }

  describe '#initialize' do
    it 'should set publish_date' do
      expect(item.publish_date).to eq(publish_date)
    end

    it 'should set id' do
      expect(item.instance_variable_get(:@id)).not_to be_nil
    end

    it 'should set archived to false by default' do
      expect(item.instance_variable_get(:@archived)).to be_falsey
    end
  end

  describe '#add_genre' do
    let(:genre) { Genre.new('Mystery') }

    it "should add the item to the genre's items list" do
      item.add_genre(genre)
      expect(genre.items).to include(item)
    end

    it "should set the item's genre" do
      item.add_genre(genre)
      expect(item.genre).to eq(genre)
    end
  end
  # Fixing the Author and Label instances in your Item tests:

  describe '#add_author' do
    let(:author) { Author.new('John', 'Doe') } # Provide both first_name and last_name

    it "should set the item's author" do
      item.add_author(author)
      expect(item.author).to eq(author)
    end
  end

  describe '#add_label' do
    let(:label) { Label.new('Bestseller', 'Red') } # Provide title and color

    it "should set the item's label" do
      item.add_label(label)
      expect(item.label).to eq(label)
    end
  end

  describe '#move_to_archive' do
    context 'when the item can be archived' do
      it 'should return true' do
        allow(Date).to receive(:today).and_return(Date.new(2023, 1, 1))
        expect(item.move_to_archive).to be_truthy
      end
    end

    context 'when the item cannot be archived' do
      it 'should return nil' do
        allow(Date).to receive(:today).and_return(Date.new(2012, 1, 1))
        expect(item.move_to_archive).to be_nil
      end
    end
  end

  describe '#can_be_archived?' do
    context 'when the item is older than 10 years' do
      it 'should return true' do
        allow(Date).to receive(:today).and_return(Date.new(2023, 1, 1))
        expect(item.can_be_archived?).to be_truthy
      end
    end

    context 'when the item is not older than 10 years' do
      it 'should return false' do
        allow(Date).to receive(:today).and_return(Date.new(2012, 1, 1))
        expect(item.can_be_archived?).to be_falsey
      end
    end
  end
end
