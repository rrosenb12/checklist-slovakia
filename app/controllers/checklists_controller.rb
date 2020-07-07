class ChecklistsController < ApplicationController
	before_action :find_checklist, only: [:show, :edit, :update, :destroy]

	def index 
		@checklists = Checklist.all
	end



	def show
		@task_checklist = TaskChecklist.new 
	end

	def new
		@checklist = Checklist.new
	end

	def create
		@checklist = Checklist.create(checklist_params)

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
		params.require(:checklist).permit(:category_id, :title)
	end

	def find_checklist
		@checklist = Checklist.find(params[:id])
	end

end
