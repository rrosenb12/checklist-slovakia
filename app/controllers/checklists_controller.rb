class ChecklistsController < ApplicationController
	before_action :find_checklist, only: [:show, :edit, :update, :destroy]

	def index 
		# @checklists = Checklist.find_by(category_name: )
	end

	def show
	
	end

	def new

	end

	def create

	end

	def edit
		
	end

	def update
		@checklist.update(checklist_params)
	end

	private 

	def checklist_params
		params.require(:checklist).permit(:title)
	end

	def find_checklist
		@checklist = Checklist.find(params[:id])
	end

end
