class TaskChecklistsController < ApplicationController

    def new
        @task_checklist = TaskChecklist.new 
        # @checklist = Checklist.find(params[:id])
    end

    def update
    end

    def create
        @task_checklist = TaskChecklist.create(task_checklist_params)

        redirect_to checklist_path(@task_checklist.checklist)
    end

    private

    def task_checklist_params
        params.require(:task_checklist).permit(:task_id, :checklist_id)
    end

end
