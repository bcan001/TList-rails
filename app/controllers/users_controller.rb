class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to lists_path(@user)
		else
			@error = "Please enter all fields to create an account"
			render 'new'
		end
	end

	def edit
		@user = User.find(session[:user_id])
	end

	def update
		@user = User.find(session[:user_id])
		@user.update
		redirect_to lists_path
	end

	def destroy
		@user.destroy
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

end
