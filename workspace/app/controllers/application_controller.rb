class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
  def check(username,password)
    username=params[:username]
    password=params[:password]
    if(username == Ghost.first.username && password == Ghost.first.password)
      redirect_to new_tales_path
    else
      redirect_to '/fail'
    end
  end
end
