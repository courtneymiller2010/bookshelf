RSpec.describe ActorsHelper do
  describe '#display_movie_links' do
    let(:actor)   { create(:actor, movies: [movie_1, movie_2]) }
    let(:movie_1) { create(:movie, name: 'Iron Man') }
    let(:movie_2) { create(:movie, name: 'Iron Man 2') }
    
    it 'returns links for movies' do
      links = helper.display_movie_links(actor)
      
      expect(links).to include("<a href=\"/movies/#{movie_1.id}\">Iron Man</a>,")
      expect(links).to include("<a href=\"/movies/#{movie_2.id}\">Iron Man 2</a>")
    end
  end
end