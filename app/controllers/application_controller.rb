class ApplicationController < ActionController::API
	before_action :set_current_user


	protected

	def user_signed_in?
		!@current_user.nil?
	end

	def authenticate_user!
		unless user_signed_in?
			render json: "Invalid token"
			return
		end
	end

	private

	def set_current_user
		@current_user = User.find_by_token(params[:token])
	end


end
