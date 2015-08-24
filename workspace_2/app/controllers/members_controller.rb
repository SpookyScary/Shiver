class MembersController < ApplicationController
  before_action :check_member, only: :index
  def new
    @member=Member.new(params[:member])
  end
  
  def index
    @members=Member.all
  end

  def create
    @member=Member.new(member_params)
    if @member.save
      session[:member_id]=@member.id
      redirect_to root_path
      flash[:message]="Welcome "+ @member.username + "! Enjoy!"
    else
      render :new
    end
  end
  
  private
  def check_member
    if @current_member
      true
    else
      redirect_to '/fail'
      flash[:denied] = 'Members'
    end
  end
  def member_params
    params.require(:member).permit(:username, :email, :password, :password_confirmation, :image)
  end
end
