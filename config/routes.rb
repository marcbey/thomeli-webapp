Thomeli2Webapp::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/qrcode/image', to: 'qrcodes#image'
  get '/qrcode/url', to: 'qrcodes#url'

  get '/download/:token', to: 'downloads#index'

  get '/:token', to: 'tokens#index'
  post '/:token', to: 'tokens#create'

  resources :downloads, only: [:index, :create]
end
