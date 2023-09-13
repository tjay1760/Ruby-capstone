require_relative '../author'

describe Author do
  author = Author.new('Ben', 'Mak')

  context 'When creating an author' do
    it 'Should have the right properties' do
      expect(author.first_name).to eq('Ben')
      expect(author.last_name).to eq('Mak')
    end
  end
end
