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

require 'rails_helper'

RSpec.describe User, type: :model do
	describe "has_secure_password" do
		it "saves the password encrypted" do
			user = User.new(nombre: "Hola", password: "12345678",
										 password_confirmation: "12345678")	
			user.save

			expect(user.password_digest).to_not be_empty

	  end
	  it "can authenticate with the password" do
	  	user = User.new(nombre: "Hola", password: "12345678",
										 password_confirmation: "12345678")	
			user.save

			expect(user.authenticate("12345678")).to be_truthy
	  end
	end

	describe "self.find_by_token" do
		it "find users by one of its tokens" do
			user = FactoryGirl.create(:user)
			token = FactoryGirl.create(:token, user: user)

			expect(User.find_by_token(token.token)).to eq(user)
		end

		it "returns nil if no user exists with specified token" do
			user = FactoryGirl.create(:user)
			token = FactoryGirl.create(:token, user: user)

			expect(User.find_by_token("mi_mama_me_mima")).to be_nil
		end
	end
  
end
