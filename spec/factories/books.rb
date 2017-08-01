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

FactoryGirl.define do
  factory :book do
    name "MyString"
    isbn "MyString"
    published "2016-05-05"
    pages_count 1
  end
end
