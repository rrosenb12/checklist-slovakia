class SessionsController < ApplicationController

    skip_before_action :auth_user, only: [:new, :create, :welcome]

    def new
        @user = User.new 
    end
      
    def create
        @user = User.find_by(username: params[:username])
        
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(session[:user_id])
        else  
            redirect_to '/login'
        end 
    end 

    def logout
        session.delete(:user_id)
        redirect_to users_path
    end 
  
end