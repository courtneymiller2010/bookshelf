require 'open-uri'

class GatherMovieInfoService
  attr_reader :movie

  def initialize(movie)
    @movie = movie
  end

  def gather
    populate_movie(retrieve_data)
    true
  end
  
  def retrieve_data
    url = omdb_url + title_params
    omdb_data = open url
    @hash = JSON.parse(omdb_data.read)
  end

  def omdb_url
    'https://www.omdbapi.com/?'
  end

  def title_params
    "&t=#{movie.name}"
  end
  
  def populate_movie(hash)
    populate_actors(hash)
    populate_simple_fields(hash)
    populate_mapped_fields(hash)
    movie.save
  end
  
  def populate_actors(hash)
    actors(hash).each do |actor_name|
      actor = Actor.find_or_create_by(name: actor_name)
      actor.movies << movie
    end
  end
  
  def actors(hash)
    hash['Actors'].split(',').map(&:strip)
  end
  
  def populate_simple_fields(hash)
    simple_fields.each do |field|
      movie.send("#{field.downcase}=", hash[field])
    end
  end
  
  def simple_fields
    ['Rated', 'Released', 'Runtime', 'Genre', 'Director', 'Writer', 
     'Language', 'Country']
  end
   
  def populate_mapped_fields(hash)
    mapped_fields.each do |local_attr, api_attr|
      movie.send("#{local_attr.to_s}=", hash[api_attr])
    end
  end
   
  def mapped_fields
    { storyline: 'Plot' }
  end
end
