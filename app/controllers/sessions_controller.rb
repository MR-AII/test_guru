class SessionsController < ApplicationController
  include SessionsHelper

  before_action :find_user

  def new

  end

  def create
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to cookies.delete(:referer)
    else
      flash.now[:alert] = 'invalid email/password combination'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @user = nil
    flash[:alert] = 'you are logged out'
    redirect_to login_path
  end

  private

  def find_user
    @user = User.find_by(email: params[:email])
  end
end