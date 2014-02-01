module PhotosHelper
  def photo_url( asset )
    Rails.configuration.photo_url + "/#{asset.token}"
  end

  def photo_url_inline( asset )
    Rails.configuration.photo_url + "/#{asset.token}?disposition=inline"
  end
end
