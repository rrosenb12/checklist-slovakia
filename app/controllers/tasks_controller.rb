class TasksController < ApplicationController

    def new
        @task = Task.new 
    end

    def create
        @task = Task.create(task_params)
        redirect_to task_path(@task)
    end

    private

    def task_params
        params.require(:task).permit(:timer_id, :category_id, :name, :description)
    end

end
