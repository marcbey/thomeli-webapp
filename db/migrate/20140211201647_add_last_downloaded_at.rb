class AddLastDownloadedAt < ActiveRecord::Migration
  def up
    add_column :assets, :last_downloaded_at, :datetime
  end

  def down
    remove_column :assets, :last_downloaded_at
  end
end
