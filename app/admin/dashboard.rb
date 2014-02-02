ActiveAdmin.register_page "Dashboard" do
  menu :priority => 0, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Assets" do
          ul do
            Asset.recent( 20 ).map do |asset|
              li link_to( asset.photo_name, admin_asset_path( asset ))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "#{Asset.count} assets totally."
          para "#{Asset.where( photo_name: nil ).count } assets without uploaded photos."
          para "Total photos size is #{number_to_human_size( Asset.sum( :photo_size ))}."
          para "Total photo downloads are #{Asset.sum( :num_photo_downloads )}."
        end
      end
    end
  end
end

