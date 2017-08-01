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

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  validates :comment, :commentable_id, :commentable_type, presence: true
end
