Thomeli2Webapp::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/qrcode/image', to: 'qrcodes#image'
  get '/qrcode/url', to: 'qrcodes#url'

  get '/:token', to: 'delivery_selections#index', as: :delivery_selection
  post '/:token', to: 'delivery_selections#create', as: :send_photo_in_email

  get '/', to: 'token_verifications#index'
  post '/', to: 'token_verifications#create', as: 'token_verification'

  get '/download/:token', to: 'downloads#index'
end

