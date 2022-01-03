module SessionsHelper
  def check_signed_in
    if session[:user]
      session[:referer] = request.url
    end
  end
end
