RSpec.describe MovieDecorator do
  let(:movie) { create(:movie, bookcase: bookcase).decorate }
  let(:bookcase) { create(:bookcase) }
  
  describe '#bookcase' do
    subject { movie.bookcase }
    
    context 'with bookcase' do
      it 'returns the bookcase' do
        expect(subject).to eq(bookcase)
      end
    end
    
    context 'without bookcase' do
      let(:bookcase) { nil }
      
      it 'returns NullBookcase' do
        expect(subject).to be_instance_of(NullBookcase)
      end
    end
  end
  
  describe '#name' do
    it 'still responds to regular attributes' do
      expect(movie.name).to eq('Test Movie')
    end
  end
end