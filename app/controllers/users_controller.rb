class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = []
    if params[:searched]
      @users = User.where("lower(username) LIKE ? AND id != ?", "%#{params[:username]}%".downcase, current_user.id)
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
