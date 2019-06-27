Rails.application.routes.draw do

  get  'login' => 'users#email_login'
  post 'logout' => 'users#logout'
  post 'users/send_token'
  get  'users/token_login'

  get  'company' => 'company#index'
  post 'company/invite_user'

  get 'insurance' => 'insurance#index'

  root to: "home#index"
end
