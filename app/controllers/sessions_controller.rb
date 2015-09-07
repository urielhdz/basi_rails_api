class SessionsController < ApplicationController
	def create
		@user = User.find_by(username: params[:username])
		if @user.authenticate(params[:password])	
			token = @user.tokens.create
			render "users/show"
		else
			render json: "Wrong credentials", status: 401
		end
	end

	def destroy
		
	end
end