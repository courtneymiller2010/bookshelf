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

class Actor < ActiveRecord::Base
  has_and_belongs_to_many :movies

  validates :name, presence: true
end
