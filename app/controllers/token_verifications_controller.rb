class TokenVerificationsController < ApplicationController
  before_filter :set_asset, only: :create

  def index
  end

  def create
    if @asset
      redirect_to delivery_selection_path( token: @asset.token )
    else
      flash[:notice] = 'Sorry, dieses Token ist falsch :-('
      render action: :index
    end
  end

  def set_asset
    @asset ||= Asset.public.with_token( params[:token] ).first
  end
end

