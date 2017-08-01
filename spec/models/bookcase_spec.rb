# == Schema Information
#
# Table name: bookcases
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text(65535)
#  shelves_count :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  picture_url   :text(65535)
#

require 'rails_helper'

RSpec.describe Bookcase, type: :model do
  describe 'associations' do
    it { should have_many(:books) }
    it { should have_many(:movies) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
