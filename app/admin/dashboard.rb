ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

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
          para "There are currently #{Asset.count} assets available"
        end
      end
    end
  end # content
end
