class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def set_asset
    @asset ||= Asset.public.with_token( params[:token] ).first!
  end
  
  def set_locale
     I18n.locale = :de
  end

  def set_admin_locale
     I18n.locale = :en
  end
end

