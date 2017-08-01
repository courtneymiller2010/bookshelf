RSpec.describe ApplicationHelper do
  describe 'link_with_icon' do
    let(:subject) { helper.link_with_icon('pencil', 'Edit', '#', class: 'btn') }
    
    it 'should return link' do
      expect(subject).to eq('<a class="btn" href="#"><i class="fa fa-pencil"></i> Edit</a>')
    end
    
    it 'calls link_to' do
      expect(helper).to receive(:link_to).and_call_original
      
      subject
    end
  end
end