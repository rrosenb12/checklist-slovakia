class TimersController < ApplicationController

    def index
        @timers = Timer.all 
    end

    def new
        @timer = Timer.new 
    end

    def create
        @timer = Timer.create(timer_params)
        redirect_to timers_path
    end

    private

    def timer_params
        params.require(:timer).permit(:minutes)
    end

end
