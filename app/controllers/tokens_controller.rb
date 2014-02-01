class TokensController < ApplicationController
  protect_from_forgery :except => :create
  before_filter :set_asset

  def index
  end

  def create
    UserMailer.send_photo( params[:email], @asset ).deliver
    render action: 'index'
  end

  def set_asset
    @asset = Asset.where( token: params[:token] ).first!
  end
end

