describe 'books/edit.html.haml' do
  let(:bookcase) { create(:bookcase, name: 'Test Bookcase') }
  let!(:book) do
    create(:book, name: 'Test Book', isbn: '1234', published: '2016-05-06',
            pages_count: 5, bookcase_id: bookcase.id)
  end
  
  before do
    assign(:book, book)

    render
  end
  
  it 'renders form' do
    expect(rendered).to have_selector("form#edit_book_#{book.id}")
    expect(rendered).to have_field('Name', with: 'Test Book')
    expect(rendered).to have_field('Isbn', with: '1234')
    expect(rendered).to have_field('Published', with: '2016')
    expect(rendered).to have_field('Pages count', with: '5')
    expect(rendered).to have_selector('select#book_bookcase_id', text: 'Test Bookcase')
    expect(rendered).to have_selector('input[type=submit]')
  end
end