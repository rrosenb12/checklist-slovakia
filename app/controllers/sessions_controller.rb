class SessionsController < ApplicationController
    
    skip_before_action :auth_user, only: [:login, :create]

    def login 
    end 
  
    def create
        user = User.find_by(username: params[:session][:username])
        
        if user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to user_path
        else  
            redirect_to new_login_path
        end 
    end 

    def logout
        session.delete(:user_id)
        redirect_to users_path
    end 
  
end