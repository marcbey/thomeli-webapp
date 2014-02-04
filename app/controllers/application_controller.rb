class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_asset
    @asset ||= Asset.public.with_token( params[:token] ).first!
  end
end

