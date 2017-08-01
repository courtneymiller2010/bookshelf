module MoviesHelper
  def display_actor_links(movie)
    movie.actors.map do |actor|
      link_to actor.name, actor_path(actor)
    end.join(', ').html_safe
  end
end
