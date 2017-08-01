require 'will_paginate/array'

describe 'movies/index.html.haml' do
  let(:movie_1) { create(:movie, name: 'Movie 1') }
  let(:movie_2) { create(:movie, name: 'Movie 2') }
  let(:movie_3) { create(:movie, name: 'Movie 3') }
  let(:movies)  { [movie_1, movie_2, movie_3].paginate(per_page: 2) }
  
  before do
    assign(:movies, movies)

    render
  end
  
  it 'displays all the movies' do
    expect(rendered).to match(/Movie 1/)
    expect(rendered).to match(/Movie 2/)
    expect(rendered).not_to match(/Movie 3/)
  end
  
  it 'displays pagination' do
    expect(rendered).to have_selector('ul.pagination')
  end
end