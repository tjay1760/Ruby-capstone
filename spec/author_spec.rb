require '../author'

describe Author do
  author = Author.new('Ben', 'Mak')
  item = Item.new

  context 'When creating an author' do
    it 'Should have the right properties' do
      expect(author.first_name).to eq('Ben')
      expect(author.last_name).to eq('Mak')
    end
  end

  context 'When adding an Item' do
    it 'should add to item list' do
      author.add_item(item)
      expect(item.author.first_name).to eq('Ben')
    end
  end
end
