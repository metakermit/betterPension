class ApplicationController < ActionController::Base

  include Authentication::Controller
  helper_method :current_user

  def authenticate
    if !current_user
      redirect_to login_url, notice: 'Login required.'
    end
  end

end
