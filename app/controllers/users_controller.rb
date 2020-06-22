class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = []
    if params[:searched]
      if params[:friends] == '1'
        @users = current_user.friends
      elsif !params[:username].empty?
        @users = User.where("lower(username) LIKE ? AND id != ?", "%#{params[:username]}%".downcase, current_user.id)
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
