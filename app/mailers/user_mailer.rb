class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = new_user_session_url
    mal(to @user.email, subject: 'Welcome to Feignbook!')
end
