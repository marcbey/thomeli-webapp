class TokenVerificationsController < ApplicationController
  before_filter :set_asset, only: :create

  def index
  end

  def create
    if @asset
      redirect_to delivery_selection_path( token: @asset.token )
    else
      flash[:notice] = t( :token_ist_falsch ).html_safe
      render action: :index
    end
  end

  def set_asset
    @asset ||= Asset.public.with_token( params[:token] ).first
  end
end

