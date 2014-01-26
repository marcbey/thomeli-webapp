ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Photos" do
          ul do
            Qrcode.recent( 20 ).map do |qrcode|
              li link_to( qrcode.photo_name, admin_qrcode_path( qrcode ))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "There are currently #{Qrcode.count} qrcodes available"
        end
      end
    end
  end # content
end
