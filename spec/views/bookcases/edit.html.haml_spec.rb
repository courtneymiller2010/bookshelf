describe 'bookcases/edit.html.haml' do
  let!(:bookcase) do
    create(:bookcase, name: 'Test Bookcase', description: "Description", 
    shelves_count: 3)
  end
  
  before do
    assign(:bookcase, bookcase)

    render
  end
  
  it 'renders form' do
    expect(rendered).to have_selector("form#edit_bookcase_#{bookcase.id}")
    expect(rendered).to have_field('Name', with: 'Test Bookcase')
    expect(rendered).to have_field('Description', with: 'Description')
    expect(rendered).to have_field('Shelves count', with: '3')
    expect(rendered).to have_selector('input[type=submit]')
  end
end