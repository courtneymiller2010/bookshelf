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

FactoryGirl.define do
  factory :movie do
    name 'Test Movie'
    storyline 'Here is a storyline'
    rated 'PG'
    released '2016-05-06'
    runtime '23 minutes'
    genre 'Fantasy'
    director 'Steven'
    writer 'George'
    language 'English'
    country 'USA'
  end
end
