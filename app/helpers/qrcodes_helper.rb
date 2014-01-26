module QrcodesHelper
  def internal_qrcode_url( qrcode )
    qrcode.url + '&internal=yes'
  end
end
