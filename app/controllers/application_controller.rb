class ApplicationController < ActionController::Base
    before_action :auth_user
    helper_method :current_user
    helper_method :logged_in?

  private

  def current_user
    User.find_by(id: session[:user_id])
  end 

  def logged_in?
    !current_user.nil?
  end

  def auth_user 
    redirect_to '/welcome' unless logged_in?
  end 

end
