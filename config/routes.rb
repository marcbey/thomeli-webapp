Thomeli2Webapp::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/qrcode', to: 'qrcodes#generate'
  get '/photo', to: 'photos#download'
end
