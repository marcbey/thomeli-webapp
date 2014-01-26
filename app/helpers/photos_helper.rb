module PhotosHelper
  def photo_url( qrcode )
    Rails.configuration.photo_url + "?token=#{qrcode.token}"
  end

  def photo_url_inline( qrcode )
    Rails.configuration.photo_url + "?token=#{qrcode.token}&disposition=inline"
  end
  
  def internal_photo_url( qrcode )
    Rails.configuration.photo_url + "?token=#{qrcode.token}&internal=yes"
  end
end
