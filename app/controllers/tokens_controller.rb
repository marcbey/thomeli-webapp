# encoding: utf-8

class TokensController < ApplicationController
  before_filter :set_asset
  protect_from_forgery :except => :create

  def index
  end

  def create
    email = params[:email]

    if valid_email_and_not_blacklisted
      UserMailer.send_photo( email, @asset ).deliver

      @asset.increment_num_photo_downloads!

      flash[:notice] = "Das Photo wurde soeben an #{email} versendet!"
    elsif email_with_wrong_format

      flash[:notice] = "Sorry, mit dieser E-Mail-Addresse können wir nichts anfangen"
    end

    render action: 'index'
  end

  def valid_email_and_not_blacklisted
    email = params[:email]

    ( email.present? and Devise.email_regexp.match( email ) and
      BlacklistedEmail.where( email: email ).count.zero? )
  end

  def email_with_wrong_format
    email = params[:email]

    ( email.present? and not Devise.email_regexp.match( email ))
  end
end

