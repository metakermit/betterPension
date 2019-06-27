class HomeController < ApplicationController

  def index
    if current_user.nil?
      redirect_to login_url
    elsif current_user.member?
      redirect_to insurance_url
    elsif current_user.admin?
      redirect_to company_url
    end
  end

end
