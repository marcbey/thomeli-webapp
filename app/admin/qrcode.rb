ActiveAdmin.register Qrcode do
  menu :priority => 1
  actions :index, :show, :destroy

  filter :photo_name
  filter :imagepath
  filter :url
  filter :created_at
  filter :updated_at

  index do
   selectable_column
   column :id
   column :photo_name
   column :url
   column :created_at
   column :photo_available do |qrcode|
     PhotoManager.new( qrcode.photo_name ).photo_exists?
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
        if PhotoManager.new( qrcode.photo_name ).photo_exists?
          image_tag internal_photo_url( qrcode )
        end
      end
    end
    active_admin_comments
  end
end

