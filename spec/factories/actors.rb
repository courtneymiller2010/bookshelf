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

FactoryGirl.define do
  factory :actor do
    name "MyString"
    birth_date "2016-05-05"
    birthplace "MyString"
  end
end
