# encoding: utf-8

class TokensController < ApplicationController
  protect_from_forgery :except => :create
  before_filter :set_asset

  def index
  end

  def create
    email = params[:email]

    if email.present? and Devise.email_regexp.match( email )
      UserMailer.send_photo( email, @asset ).deliver

      @asset.increment_num_photo_downloads!
   
      flash[:notice] = "Das Photo wurde soeben an #{email} versendet!"
    elsif email.present? and !Devise.email_regexp.match( email )

      flash[:notice] = "Sorry, mit dieser E-Mail-Addresse können wir nichts anfangen"
    end

    render action: 'index'
  end

  def set_asset
    @asset = Asset.where( token: params[:token] ).first!
  end
end

