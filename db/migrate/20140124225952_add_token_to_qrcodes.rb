class AddTokenToQrcodes < ActiveRecord::Migration
  def change
    add_column :qrcodes, :token, :string

  end
end
