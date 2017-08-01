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

class Movie < ActiveRecord::Base
  belongs_to :bookcase
  has_and_belongs_to_many :actors
  has_many :comments, as: :commentable

  validates :name, presence: true, uniqueness: true
end
