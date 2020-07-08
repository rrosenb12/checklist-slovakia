class TaskChecklistsController < ApplicationController

    def new
        @task_checklist = TaskChecklist.new 
    end

    def create
        @task_checklist = TaskChecklist.create(task_checklist_params)
        if @task_checklist.valid?
            redirect_to checklist_path(@task_checklist.checklist)
        else
            flash[:my_errors] = @task_checklist.errors.full_messages
            redirect_to checklist_path(@task_checklist.checklist)
        end
    end

    private

    def task_checklist_params
        params.require(:task_checklist).permit(:task_id, :checklist_id)
    end

end
