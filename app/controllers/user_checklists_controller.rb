class UserChecklistsController < ApplicationController
	def new
		@user_checklist = UserChecklist.new 
		@users = User.all
		@checklists = Checklist.all
	end

	def create
		@current_user.user_checklists << UserChecklist.create(user_checklist_params)
		redirect_to user_path(@current_user)
	end

	private 

	def user_checklist_params
		params.require(:user_checklist).permit(:user_id, :checklist_id)
	end


end
