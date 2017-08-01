describe 'movies/show.html.haml' do
  let(:bookcase) { create(:bookcase, name: 'Bookcase Name') }
  let(:actor)    { create(:actor, name: 'Robert') }
  let!(:movie) do
    create(:movie, name: 'Iron Man', bookcase: bookcase, actors: [actor])
  end
  
  before do
    assign(:movie, movie.decorate)

    render
  end
  
  it 'renders show' do
    expect(rendered).to match(/Title:/)
    expect(rendered).to match(/Iron Man/)

    expect(rendered).to match(/Bookcase:/)
    expect(rendered).to match(/Bookcase Name/)

    expect(rendered).to match(/Storyline:/)
    expect(rendered).to match(/Here is a storyline/)

    expect(rendered).to match(/Rated:/)
    expect(rendered).to match(/PG/)
    
    expect(rendered).to match(/Released:/)
    expect(rendered).to match(/2016-05-06/)

    expect(rendered).to match(/Runtime:/)
    expect(rendered).to match(/23 minutes/)

    expect(rendered).to match(/Genre:/)
    expect(rendered).to match(/Fantasy/)

    expect(rendered).to match(/Director:/)
    expect(rendered).to match(/Steven/)

    expect(rendered).to match(/Writer:/)
    expect(rendered).to match(/George/)

    expect(rendered).to match(/Actors:/)
    expect(rendered).to match(/Robert/)

    expect(rendered).to match(/Language:/)
    expect(rendered).to match(/English/)

    expect(rendered).to match(/Country:/)
    expect(rendered).to match(/USA/)
  end
  
  it 'renders comments' do
    expect(view).to render_template('comments/_comment_section')
  end
  
  context 'when no bookcase' do
    let(:bookcase) { nil }
    
    it 'renders None for bookcase if no bookcase' do
      expect(rendered).to match(/None/)
    end
  end
end