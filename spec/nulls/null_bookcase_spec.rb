RSpec.describe NullBookcase do
  let(:null_bookcase) { described_class.new }

  describe '#name' do
    it "returns 'None'" do
      expect(null_bookcase.name).to eq('None')
    end
  end
end