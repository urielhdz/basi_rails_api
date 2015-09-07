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

class User < ActiveRecord::Base
	has_secure_password
	has_many :tokens
	has_many :purchases
	has_many :products, through: :purchases

	def token
		last_token = tokens.last
		last_token.nil? ? nil : last_token.token
	end

	def self.find_by_token(token)
		joins(:tokens).find_by(tokens: {token: token} )
	end
end
