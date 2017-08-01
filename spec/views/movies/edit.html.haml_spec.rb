describe 'movies/edit.html.haml' do
  let(:bookcase) { create(:bookcase, name: 'Test Bookcase') }
  let!(:movie) do
    create(:movie, name: 'Test Movie', storyline: 'here is a storyline', 
    bookcase_id: bookcase.id)
  end
  
  before do
    assign(:movie, movie)

    render
  end
  
  it 'renders form' do
    expect(rendered).to have_selector("form#edit_movie_#{movie.id}")
    # expect(rendered).to have_selector('select#movie_name', text: 'Test Movie')
    expect(rendered).to have_selector('input#movie_name[value="Test Movie"]')
    expect(rendered).to have_selector('select#movie_bookcase_id', text: 'Test Bookcase')
    expect(rendered).to have_selector('input[type=submit]')
  end
end