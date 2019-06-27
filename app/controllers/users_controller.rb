class UsersController < ApplicationController

  def email_login
  end

  def send_token
    user = User.find_by(email: params[:email])
    if user.nil?
      redirect_to login_url, notice: "User not found"
    else
      token = user.generate_login_token
      UserMailer.login(token).deliver_later
    end
  end

  def token_login
    login_token = UserLoginToken.find_by(token: params[:token]) if params[:token].present?
    user = login_token.user if login_token

    if user
      user.registered! if user.invited?
      log_in(user)
      login_token.destroy
      redirect_to root_url
    else
      redirect_to login_url, notice: "Login URL invalid."
    end
  end

  def logout
    log_out
    redirect_to login_url
  end

end
