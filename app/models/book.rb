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

class Book < ActiveRecord::Base
  belongs_to :bookcase
  has_many :comments, as: :commentable

  validates :name, presence: true
end
