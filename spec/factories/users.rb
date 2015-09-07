# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  nombre          :string
#  direccion       :string
#  username        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :user do
    nombre "MyString"
		direccion "MyString"
		username "MyString"
		password "MyString"
		password_confirmation "MyString"
  end

end
