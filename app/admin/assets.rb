ActiveAdmin.register Asset do
  menu :priority => 1
  actions :index, :show, :destroy

  filter :photo_name
  filter :photo_empty, :label => 'Photo Available', :as => :select,
    :collection => {:Yes => 1, :No => 0}

  filter :url
  filter :created_at
  filter :updated_at

  index do
   selectable_column
   column :id
   column :photo_name
   column :url do |asset|
     if asset.photo.present?
       link_to asset.url, asset.url
      else
        asset.url
      end
   end
   column :created_at
   column :last_downloaded_at
   column :thumbnail do |asset|
     if asset.photo.present?
       image_tag asset.photo.thumb( '50x50#' ).url
     end
   end
   default_actions
  end

  show do |asset|
    attributes_table do
      row :id
      row :photo_name
      row :url do |asset|
        if asset.photo.present?
          link_to asset.url, asset.url
        else
          asset.url
        end
      end
      row :created_at
      row :updated_at
      # row :num_qrcodes_downloads
      row :num_photo_downloads
      row :last_downloaded_at
      row :qr_code do
        image_tag asset.qrcode.url
      end
      row :photo do
        if asset.photo.present?
          image_tag asset.photo.url
        end
      end
    end
    active_admin_comments
  end
end

