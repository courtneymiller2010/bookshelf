describe 'actors/edit.html.haml' do
  let!(:actor) do
    create(:actor, name: 'Test Actor', birth_date: "2016-05-06", 
    birthplace: 'Charleston, SC')
  end
  
  before do
    assign(:actor, actor)

    render
  end
  
  it 'renders form' do
    expect(rendered).to have_selector("form#edit_actor_#{actor.id}")
    expect(rendered).to have_field('Name', with: 'Test Actor')
    expect(rendered).to have_field('Birth date', with: '2016')
    expect(rendered).to have_field('Birthplace', with: 'Charleston, SC')
    expect(rendered).to have_selector('input[type=submit]')
  end
end