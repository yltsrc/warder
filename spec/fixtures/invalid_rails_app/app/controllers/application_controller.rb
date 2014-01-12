class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def welcome
    @user = User.new(params[:first_name], params[:last_name], params[:email], params[:password], params[:password_confirmation])
    if @user
      @logged_in = true
      render text: "Hello #{@user.full_name}!"
    else
      render text: "Hello Anonymous!"
    end
  end
end
