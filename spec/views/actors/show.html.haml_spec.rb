describe 'actors/show.html.haml' do
  let!(:actor) do
    create(:actor, name: 'Test Actor', birth_date: "2016-05-06", 
    birthplace: 'Charleston, SC')
  end
  
  before do
    assign(:actor, actor)

    render
  end
  
  it 'renders show' do
    expect(rendered).to match(/Test Actor/)
    expect(rendered).to match(/2016-05-06/)
    expect(rendered).to match(/Charleston, SC/)
  end
end