require_relative '../genre'

describe Genre do
  genre = Genre.new('rap')

  context 'When creating new genre' do
    it 'should have the right properties' do
      expect(genre.name).to eq('rap')
    end
  end

  # contet 'When adding a genre to an item' do
  #   it '' do
  #     genre.add_item(item)
  #     expect(item.genre.name).to eq(genre.name)
  #   end
  # end
end
