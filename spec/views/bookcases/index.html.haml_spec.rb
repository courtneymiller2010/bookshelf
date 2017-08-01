require 'will_paginate/array'

describe 'bookcases/index.html.haml' do
  let(:bookcase_1) { create(:bookcase, name: 'Bookcase 1') }
  let(:bookcase_2) { create(:bookcase, name: 'Bookcase 2') }
  let(:bookcase_3) { create(:bookcase, name: 'Bookcase 3') }
  let(:bookcases)  { [bookcase_1, bookcase_2, bookcase_3].paginate(per_page: 2) }
  
  before do
    assign(:bookcases, bookcases)

    render
  end
  
  it 'displays all the bookcases' do
    expect(rendered).to match(/Bookcase 1/)
    expect(rendered).to match(/Bookcase 2/)
    expect(rendered).not_to match(/Bookcase 3/)
  end
  
  it 'displays pagination' do
    expect(rendered).to have_selector('ul.pagination')
  end
end