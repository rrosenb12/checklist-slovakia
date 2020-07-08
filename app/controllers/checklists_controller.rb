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
			current_user.checklists << @checklist
			TaskChecklist.create(:checklist_id => @checklist.id, :task_id => params[:task_id])
			redirect_to checklist_path(@checklist.id)
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
