describe 'bookcases/show.html.haml' do
  let!(:bookcase) do
    create(:bookcase, name: 'Test Bookcase', description: "here is a description", 
    shelves_count: 3)
  end
  
  before do
    assign(:bookcase, bookcase)

    render
  end
  
  it 'renders show' do
    expect(rendered).to match(/Test Bookcase/)
    expect(rendered).to match(/here is a description/)
    expect(rendered).to match(/3/)
  end
end