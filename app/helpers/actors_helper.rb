module ActorsHelper
  def display_movie_links(actor)
    actor.movies.map do |movie|
      link_to movie.name, movie_path(movie)
    end.join(', ').html_safe
  end
end
