class ChecklistsController < ApplicationController
	before_action :find_checklist, only: [:show, :edit, :update, :destroy]

	def index 
		# @checklists = Checklist.find_by(category_name: )
	end

	def show
	
	end

	private 

	def find_checklist
		@checklist = Checklist.find(params[:id])
	end

end
