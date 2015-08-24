class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by(username: params[:username])
    if member && member.authenticate(params[:password])
      session[:member_id]=member.id
      redirect_to root_path
      flash[:message]="You have successfully logged in!"
    else
      flash.now[:error]="Invalid Username and/or Password"
      render 'new'
    end
  end
  
  def destroy
    reset_session
    redirect_to root_path
    flash[:message]="You have successfully logged out!"
  end
end
