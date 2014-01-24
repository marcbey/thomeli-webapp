ActiveAdmin.register Qrcode do
  menu :priority => 1
  actions :all, :except => [:edit]

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
   default_actions
  end

  show do |qrcode|
    attributes_table do
      row :id
      row :imagename
      row :imagepath
      row :url
      row :created_at
      row :updated_at
      row :num_qrcodes_downloads
      row :num_photo_downloads
      row :qr_code do
        image_tag qrcode.qrcode.url
      end
    end
    active_admin_comments
  end
end

