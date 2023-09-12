require '../genre'

describe MusicAlbum do
    context "When creating new music" do
        music = MusicAlbum.new(false)
        it "Should have the right properties" do
            expect(music).to be_instance_of(MusicAlbum)
        end
    end

    contect "when Archiving a music" do
        it "" do
        end

    contet "When adding a genre to a music" do
        it "" do
        end
    end
end