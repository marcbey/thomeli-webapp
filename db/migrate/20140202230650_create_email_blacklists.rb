class CreateEmailBlacklists < ActiveRecord::Migration
  def change
    create_table :blacklisted_emails do |t|
      t.string :email

      t.timestamps
    end
  end
end
