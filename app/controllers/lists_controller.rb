class ListsController < ApplicationController
	def index
		@lists = List.where(user_id: session[:user_id])
	end

	def show
		@list = List.find(params[:id])

	end

	def new
		@list = List.new
	end

	def create
		@list = User.find(session[:user_id]).lists.build(list_params)
		if @list.save
			redirect_to lists_path
		else
			@errors = "Please create a proper list"
			render 'new'
		end
	end

	def edit
		@list = List.find(params[:id])
	end

	def update
		@list = List.find(params[:id])
		@list.update(list_params)
		redirect_to lists_path
	end

	def destroy
		@list = List.find(params[:id])
		@list.destroy
		redirect_to lists_path
	end
	private
	def list_params
		params.require(:list).permit(:name)
	end

end
