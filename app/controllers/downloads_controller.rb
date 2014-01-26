class DownloadsController < ApplicationController
  protect_from_forgery :except => :create
  before_filter :set_qrcode

  def index
  end

  def create
    UserMailer.send_photo( params[:email], params[:token] ).deliver
    render action: 'index'
  end

  def set_qrcode
    @qrcode = QrcodeManager.qrcode_by_token( params[:token] )
  end
end
