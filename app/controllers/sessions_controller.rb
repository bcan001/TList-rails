class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(:username => session_params[:username]).try(:authenticate, session_params[:password])

		if @user
			session[:user_id] = @user.id
			redirect_to lists_path
		else
			@error = "Incorrect username, email, or password"
			render 'sessions/new'
		end

	end

	def destroy
		session.destroy
		redirect_to root_path
	end

	private

	def session_params
		params.require(:session).permit(:username, :email, :password)
	end
end
