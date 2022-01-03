class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  helper_method :current_user, :logged_in?, :user_id

  private

  def authenticate_user!
    cookies[:referer] = request.original_url
    unless current_user
      redirect_to login_path, alert: 'Are your a Guru? Verify your Email and Password please'
    end

    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def user_id
    @current_user.id
  end
end