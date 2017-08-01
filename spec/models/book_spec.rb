# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  isbn        :string(255)
#  published   :date
#  pages_count :integer
#  bookcase_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it { should belong_to(:bookcase) }
    it { should have_many(:comments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
