class UserMailer < ApplicationMailer

  def invite(login_token)
    @login_token = login_token
    mail(to: @login_token.user.email, subject: 'Better Pension Invite')
  end

  def login(login_token)
    @login_token = login_token
    mail(to: @login_token.user.email, subject: 'Better Pension Login')
  end
end
