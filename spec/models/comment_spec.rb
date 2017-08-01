# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  comment          :text(65535)
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_comments_on_commentable_id    (commentable_id)
#  index_comments_on_commentable_type  (commentable_type)
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:commentable) }
  end

  describe 'validations' do
    it { should validate_presence_of(:comment) }
    it { should validate_presence_of(:commentable_id) }
    it { should validate_presence_of(:commentable_type) }
  end
end
