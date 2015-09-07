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

class Token < ActiveRecord::Base
  belongs_to :user
  before_create :generate_token
  
  private
  
  def generate_token
  	begin
  		self.token = SecureRandom.hex
  	end while Token.where(token: self.token).any?
  end
end
