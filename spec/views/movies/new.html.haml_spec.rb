describe 'movies/new.html.haml' do
  before do
    assign(:movie, Movie.new)

    render
  end
  
  it 'renders form' do
    expect(rendered).to have_selector('form#new_movie')
    expect(rendered).to have_selector('select#movie_name')
    expect(rendered).to have_selector('select#movie_bookcase_id')
    expect(rendered).to have_selector('input[type=submit]')
  end
end