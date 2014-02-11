class QrcodeEmbedUrlProcessor
  def call( content, asset, url, font_size = 9 )
    # See for options http://markevans.github.io/dragonfly/imagemagick/
    args = { 'font-family' => 'Monaco', 'font-size' => font_size }
    url_image = Dragonfly.app.generate( :text, asset.url, args )

    content.shell_update( ext: 'png', escape: false ) do |old_path, new_path|
      "composite -gravity south #{url_image.path} #{asset.qrcode.path} #{new_path}"
    end
  end
end

