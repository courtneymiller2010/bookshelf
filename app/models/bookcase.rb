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

class Bookcase < ActiveRecord::Base
  has_many :books
  has_many :movies

  validates :name, presence: true
end
