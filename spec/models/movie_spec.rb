# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  storyline   :text(65535)
#  bookcase_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  rated       :string(255)
#  released    :date
#  runtime     :string(255)
#  genre       :string(255)
#  director    :string(255)
#  writer      :string(255)
#  language    :string(255)
#  country     :string(255)
#

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'associations' do
    it { should belong_to(:bookcase) }
    it { should have_and_belong_to_many(:actors) }
    it { should have_many(:comments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
