ActiveAdmin.register Qrcode do
  menu :priority => 1
  actions :index, :show, :destroy

  filter :imagename
  filter :imagepath
  filter :url
  filter :created_at
  filter :updated_at

  index do
   selectable_column
   column :id
   column :imagename
   column :url
   column :created_at
   column :photo_available do |qrcode|
     photo_url = Rails.root.join( 'photos', qrcode.imagename )
     photo = File.exists?( photo_url )
   end
   default_actions
  end

  show do |qrcode|
    attributes_table do
      row :id
      row :url
      row :created_at
      row :updated_at
      row :num_qrcodes_downloads
      row :num_photo_downloads
      row :qr_code do
        image_tag qrcode.qrcode.url
      end
      row :photo do
        photo_url = Rails.root.join( 'photos', qrcode.imagename )
        photo = File.exists?( photo_url )
        image_tag qrcode.url + 'internal=yes' if photo
      end
    end
    active_admin_comments
  end
end

