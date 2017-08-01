require 'rails_helper'

RSpec.describe GatherMovieInfoService do
  let(:service) { described_class.new(movie) }
  let(:movie)   { create(:movie, name: 'The Jungle Book') }
  let!(:harris) { create(:actor, name: 'Phil Harris') }
  
  before do
    allow(JSON).to receive(:parse).and_return(sample_data_hash)
  end
  
  let(:plot) do
    "Bagheera the Panther and Baloo the Bear have a difficult time trying to \
    convince a boy to leave the jungle for human civilization."
  end
  
  let(:sample_data_hash) do
    {"Title"=>"The Jungle Book",
     "Year"=>"1967",
     "Rated"=>"APPROVED",
     "Released"=>"11 May 1967",
     "Runtime"=>"78 min",
     "Genre"=>"Animation, Adventure, Comedy",
     "Director"=>"Wolfgang Reitherman",
     "Writer"=>"Larry Clemmons",
     "Actors"=>"Phil Harris, Sebastian Cabot, Bruce Reitherman, George Sanders",
     "Plot"=>plot,
     "Language"=>"English",
     "Country"=>"USA",
     "Awards"=>"Nominated for 1 Oscar. Another 4 wins & 3 nominations.",
     "Poster"=>"http://ia.media-imdb.com/images/M/MV5BMjAwMTExODExNl5BMl5BanBnXkFtZTgwMjM2MDgyMTE@._V1_SX300.jpg",
     "Metascore"=>"N/A",
     "imdbRating"=>"7.6",
     "imdbVotes"=>"118,655",
     "imdbID"=>"tt0061852",
     "Type"=>"movie",
     "Response"=>"True"}
  end
  
  describe '#initialize' do
    it 'has attr_reader for movie' do
      expect(service.movie).to eq(movie)
    end
  end

  # omdbapi has gone private, so these methods no longer work
  describe '#gather' do
    it 'populates the movie', :pending do
      expect(service.gather).to eq(true)
      
      expect(movie.storyline).to  eq(sample_data_hash['Plot'])
      expect(movie.rated).to      eq(sample_data_hash['Rated'])
      expect(movie.released).to   eq(Date.parse(sample_data_hash['Released']))
      expect(movie.runtime).to    eq(sample_data_hash['Runtime'])
      expect(movie.genre).to      eq(sample_data_hash['Genre'])
      expect(movie.director).to   eq(sample_data_hash['Director'])
      expect(movie.writer).to     eq(sample_data_hash['Writer'])
      expect(movie.language).to   eq(sample_data_hash['Language'])
      expect(movie.country).to    eq(sample_data_hash['Country'])
      
      expect(movie.actors.map(&:name)).to include('Sebastian Cabot',
                                                  'Bruce Reitherman',
                                                  'George Sanders')
      expect(movie.actors).to include(harris)
    end
  end
  
  describe '#retrieve_data' do
    
  end
  
  describe '#omdb_url' do
    it 'returns the correct url' do
      expect(service.omdb_url).to match(/https:\/\/www.omdbapi.com\/\?/)
    end
  end
  
  describe '#title_params' do
    it 'creates params for movie title' do
      expect(service.title_params).to match(/&t=The Jungle Book/)
    end
  end

  describe '#populate_movie' do
    it 'calls out to actors, simple_fields, mapped_fields' do
      expect(service).to receive(:populate_actors).and_call_original
      expect(service).to receive(:populate_simple_fields).and_call_original
      expect(service).to receive(:populate_mapped_fields).and_call_original
      expect(movie).to receive(:save).and_call_original
      
      service.populate_movie(sample_data_hash)
    end
  end
  
  describe '#actors' do
    let(:subject) { service.actors(sample_data_hash) }
    
    it 'returns an array of actors' do
      expect(subject).to eq(['Phil Harris', 'Sebastian Cabot', 
                             'Bruce Reitherman', 'George Sanders'])
    end
  end
  
  describe '#populate_simple_fields' do
    it 'calls setter for each simple field' do
      expect(movie).to receive('rated=').with('APPROVED').and_call_original
      expect(movie).to receive('released=').with('11 May 1967').and_call_original
      expect(movie).to receive('runtime=').with('78 min').and_call_original
      expect(movie).to receive('genre=').with('Animation, Adventure, Comedy').and_call_original
      expect(movie).to receive('director=').with('Wolfgang Reitherman').and_call_original
      expect(movie).to receive('writer=').with('Larry Clemmons').and_call_original
      expect(movie).to receive('language=').with('English').and_call_original
      expect(movie).to receive('country=').with('USA').and_call_original
      
      service.populate_simple_fields(sample_data_hash)
    end
  end
  
  describe '#simple_fields' do
    it 'returns a list of simple fields' do
      expect(service.simple_fields).to include('Rated', 'Released', 'Runtime',
                                                'Genre', 'Director', 'Writer', 
                                                'Language', 'Country')
    end
  end
  
  describe '#populate_mapped_fields' do
    it 'calls setters for each mapped fields' do
      expect(movie).to receive('storyline=').with(plot).and_call_original
      
      service.populate_mapped_fields(sample_data_hash)
    end
  end
  
  describe '#mapped_fields' do
    it 'returns a hash of mapped fields' do
      expect(service.mapped_fields[:storyline]).to eq('Plot')
    end
  end
end
