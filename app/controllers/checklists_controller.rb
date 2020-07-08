class ChecklistsController < ApplicationController
	before_action :find_checklist, only: [:show, :edit, :update, :destroy]

	def task_name=(name)
		self.task = Task.find_or_create_by(name: name)
	end

	def task_name
		self.task ? self.task.name : nil
	end

	def index 
		@checklists = Checklist.all
	end

	def show
		@task_checklist = TaskChecklist.new 
	end

	def new
		@checklist = Checklist.new
		@checklist.task_checklists.build
	end

	def create
		# byebug
		@checklist = Checklist.create(checklist_params)
		if @checklist.valid?	
			current_user.checklists << @checklist
			params[:task_id].each do |taskid|
				TaskChecklist.create(:checklist_id => @checklist.id, :task_id => taskid)
			end
			redirect_to checklist_path(@checklist.id)
		else
			flash[:my_errors] = @checklist.errors.full_messages
			redirect_to new_checklist_path
		end
	end

	def edit
	end

	def update
		@checklist.update(checklist_params)
	end

	def destroy
		@checklist.delete
		redirect_to category_path(@checklist.category)
	end

	def follow
		@user = User.find(session[:user_id])
    @checklist = Checklist.find(params[:id])
    @user.checklists << @checklist
    redirect_to user_path(@user)
  end

  # def unfollow
  #   @user = User.find(params[:id])
  #   @current_user.followed_users.find_by(followee_id: 
  #       @user.id).destroy
  #   redirect_to user_path(@user)
  # end

	private 

	def checklist_params
		params.require(:checklist).permit(
			:category_id, :title, :task_attributes => [:id, :name, :description]
		)
	end

	def find_checklist
		@checklist = Checklist.find(params[:id])
	end

end
