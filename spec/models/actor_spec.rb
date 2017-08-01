# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  birth_date :date
#  birthplace :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:movies) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
  end
end
