require_relative '../author'
require_relative '../item'

describe Author do
  author = Author.new('Ben', 'Mak')
  item = Item.new('2029-10-01')

  context 'When creating an author' do
    it 'Should have the right properties' do
      expect(author.first_name).to eq('Ben')
      expect(author.last_name).to eq('Mak')
    end
  end

  context 'When adding an item' do
    it 'Should be add author to the item' do
      author.add_item(item)
      expect(item.author).to eq(author)
    end
  end
end
