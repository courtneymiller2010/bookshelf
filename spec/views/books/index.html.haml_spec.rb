require 'will_paginate/array'

describe 'books/index.html.haml' do
  let(:book_1) { create(:book, name: 'Book 1') }
  let(:book_2) { create(:book, name: 'Book 2') }
  let(:book_3) { create(:book, name: 'Book 3') }
  let(:books)  { [book_1, book_2, book_3].paginate(per_page: 2) }
  
  before do
    assign(:books, books)

    render
  end
  
  it 'displays all the books' do
    expect(rendered).to match(/Book 1/)
    expect(rendered).to match(/Book 2/)
    expect(rendered).not_to match(/Book 3/)
  end
  
  it 'displays pagination' do
    expect(rendered).to have_selector('ul.pagination')
  end
end