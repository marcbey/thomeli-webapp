require 'tempfile'

ActiveAdmin.register Qrcode do
  show do |qrcode|
    attributes_table do
      row :id
      row :imagename
      row :imagepath
      row :created_at
      row :updated_at
      row :qr_code do
        image_tag qrcode.qrcode.url
      end
    end
    active_admin_comments
  end
end

