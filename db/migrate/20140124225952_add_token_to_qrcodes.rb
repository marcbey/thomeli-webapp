class AddTokenToQrcodes < ActiveRecord::Migration
  def up
    add_column :qrcodes, :token, :string
  end

  def down
    remove_column :qrcodes, :token
  end
end

