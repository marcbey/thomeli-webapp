class DownloadsController < ApplicationController
  def index
    @qrcode = QrcodeManager.qrcode_by_token( params[:token] )
  end

  def create
  end
end
