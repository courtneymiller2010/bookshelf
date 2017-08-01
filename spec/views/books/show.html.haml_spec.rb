describe 'books/show.html.haml' do
  let(:bookcase) { create(:bookcase, name: 'Bookcase Name') }
  let!(:book) do
    create(:book, name: 'Test Book', isbn: '1234', published: '2016-05-06',
            pages_count: 5, bookcase: bookcase).decorate
  end
  
  before do
    assign(:book, book)

    render
  end
  
  it 'renders show' do
    expect(rendered).to match(/Test Book/)
    expect(rendered).to match(/1234/)
    expect(rendered).to match(/2016-05-06/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Bookcase Name/)
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