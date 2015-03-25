class TasksController < ApplicationController
	def new
		@list = List.find(params[:list_id])

	end


	def create
		@list = List.find(params[:list_id])

		if session[:user_id]
			@task = @list.tasks.create(task_params)
			#binding.pry
			# puts '-'*20
			# puts comment_params
			# puts '-'*20
			redirect_to list_path(@list)
		else
			flash[:notice] = "You need to be logged in to create tasks"
			redirect_to list_path(@list)
  	end
	end



	def edit
		@list = List.find(params[:list_id])
		@task = @list.tasks.find(params[:id])
	end

	def update
		@list = List.find(params[:list_id])
		@task = @list.tasks.find(params[:id])
		@task.update(task_params)
		redirect_to list_path(@list)
	end

	def destroy
		@list = List.find(params[:list_id])
		@task = @list.tasks.find(params[:id])
		@task.destroy
		redirect_to list_path(@list)
	end

	# marking tasks as complete
	def complete
		@list = List.find(params[:list_id])
		@task = @list.tasks.find(params[:id])



		redirect_to lists_path(@list)
	end


	private
	def task_params
		params.require(:task).permit(:task, :due_date, :completed)
	end


end
