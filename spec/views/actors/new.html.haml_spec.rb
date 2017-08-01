describe 'actors/new.html.haml' do
  before do
    assign(:actor, Actor.new)

    render
  end
  
  it 'renders form' do
    expect(rendered).to have_selector('form#new_actor')
    expect(rendered).to have_selector('input#actor_name')
    expect(rendered).to have_selector('select#actor_birth_date_1i')
    expect(rendered).to have_selector('select#actor_birth_date_2i')
    expect(rendered).to have_selector('select#actor_birth_date_3i')
    expect(rendered).to have_selector('input#actor_birthplace')
    expect(rendered).to have_selector('input[type=submit]')
  end
end