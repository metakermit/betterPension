class CompanyController < ApplicationController
  before_action :authenticate
  before_action :check_admin

  def index
    @company = current_user.company
  end

  def invite_user
    user = current_user.company.users.find_by(email: params[:email])
    if user
      redirect_to company_url, notice: "User already invited" and return
    end

    user = User.create(email: params[:email], company: current_user.company)
    token = user.generate_login_token
    UserMailer.invite(token).deliver_later
    redirect_to company_url
  end

  private

  def check_admin
    if !current_user.admin?
      redirect_to root_url, notice: "You don't have access rights for this page"
    end
  end

end
