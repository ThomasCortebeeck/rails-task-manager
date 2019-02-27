class TasksController < ApplicationController
	def index
		@tasks = Task.all
		# fetch all tasks from the class Task
		# note: we name our view after the method!
	end

	def show
		@task = Task.find(params[:id])
		# singular @task! -> find using the params in the url
	end

	def new
		@task = Task.new
	end

	def create
		# @task = Task.new(params[:task]) -> error: ActiveModel::ForbiddenAttributesError in TasksController#create
		# :task -> comes from hash  form example: {task: {title: "La tour d'argent",details: "15 Quai de la Tournelle"}}
		@task = Task.new(task_params)
		if @task.save
			redirect_to @task
		else 
			render :new
			# if error happen when object is saved, redirected back to the form in order to fix what was broken
		end
	end

	def edit
		@task = Task.find(params[:id])
		# when you go to /id/edit you have the task title and details prefilled
	end

	def update
		@task = Task.find(params[:id])
		if @task.update(task_params)
			redirect_to @task
		else
			render :edit
		end
	end 

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
	end

end

  private

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user -> Never trust user data!
    params.require(:task).permit(:title, :details) # permit the fields from the form (these fields can be found in the DB)
  end




