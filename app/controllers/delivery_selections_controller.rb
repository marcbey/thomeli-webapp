class DeliverySelectionsController < ApplicationController
  before_filter :set_asset

  def index
  end

  def create
    email = params[:email]

    if valid_email_and_not_blacklisted
      UserMailer.send_photo( email, @asset ).deliver

      @asset.increment_num_photo_downloads!

      flash[:notice] = t( :photo_wurde_gesendet, email: email ).html_safe
    elsif email_with_wrong_format

      flash[:notice] = t( :email_ist_falsch ).html_safe
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

