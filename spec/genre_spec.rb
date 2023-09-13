require_relative '../genre'
require_relative '../item'

describe Genre do
  genre = Genre.new('rap')
  item = Item.new(Date.parse('2029-10-01'))

  context 'When creating new genre' do
    it 'should have the right properties' do
      expect(genre.name).to eq('rap')
    end
  end

  context 'When adding a genre to an item' do
    it 'Should add genre to the item' do
      genre.add_item(item)
      expect(item.genre).to eq(genre)
    end
  end
end
