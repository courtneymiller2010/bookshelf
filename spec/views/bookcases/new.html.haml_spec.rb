describe 'bookcases/new.html.haml' do
  before do
    assign(:bookcase, Bookcase.new)

    render
  end
  
  it 'renders form' do
    expect(rendered).to have_selector('form#new_bookcase')
    expect(rendered).to have_selector('input#bookcase_name')
    expect(rendered).to have_selector('textarea#bookcase_description')
    expect(rendered).to have_selector('input#bookcase_shelves_count')
    expect(rendered).to have_selector('input[type=submit]')
  end
end