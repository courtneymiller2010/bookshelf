RSpec.describe MoviesHelper do
  describe '#display_actor_links' do
    let(:movie)   { create(:movie, actors: [actor_1, actor_2]) }
    let(:actor_1) { create(:actor, name: 'George') }
    let(:actor_2) { create(:actor, name: 'Steve') }
    
    it 'returns links for actors' do
      links = helper.display_actor_links(movie)
      
      expect(links).to include("<a href=\"/actors/#{actor_1.id}\">George</a>,")
      expect(links).to include("<a href=\"/actors/#{actor_2.id}\">Steve</a>")
    end
  end
end