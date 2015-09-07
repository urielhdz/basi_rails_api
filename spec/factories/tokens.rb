# == Schema Information
#
# Table name: tokens
#
#  id         :integer          not null, primary key
#  token      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :token do
		association :user, factory: :user
  end

end
