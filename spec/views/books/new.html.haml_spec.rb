describe 'books/new.html.haml' do
  before do
    assign(:book, Book.new)

    render
  end
  
  it 'renders form' do
    expect(rendered).to have_selector('form#new_book')
    expect(rendered).to have_selector('input#book_name')
    expect(rendered).to have_selector('input#book_isbn')
    expect(rendered).to have_selector('select#book_published_1i')
    expect(rendered).to have_selector('input#book_pages_count')
    expect(rendered).to have_selector('select#book_bookcase_id')
    expect(rendered).to have_selector('input[type=submit]')
  end
end