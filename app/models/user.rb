class User < ApplicationRecord
  belongs_to :company
  has_one :user_login_token

  enum role: { member: 0, admin: 1 }
  enum status: { invited: 0, registered: 1 }

  validates_presence_of :email

  def generate_login_token
    user_login_token || create_user_login_token(token: SecureRandom.uuid)
  end

end
