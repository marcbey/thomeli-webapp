module PhotosHelper
  def photo_url_inline( qrcode )
    qrcode.url + '&disposition=inline'
  end

  def photo_url( qrcode )
    qrcode.url
  end
end
