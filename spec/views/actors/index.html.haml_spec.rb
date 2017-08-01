require 'will_paginate/array'

describe 'actors/index.html.haml' do
  let(:actor_1) { create(:actor, name: 'Actor 1') }
  let(:actor_2) { create(:actor, name: 'Actor 2') }
  let(:actor_3) { create(:actor, name: 'Actor 3') }
  let(:actors)  { [actor_1, actor_2, actor_3].paginate(per_page: 2) }
  
  before do
    assign(:actors, actors)

    render
  end
  
  it 'displays all the actors' do
    expect(rendered).to match(/Actor 1/)
    expect(rendered).to match(/Actor 2/)
    expect(rendered).not_to match(/Actor 3/)
  end
  
  it 'displays pagination' do
    expect(rendered).to have_selector('ul.pagination')
  end
end