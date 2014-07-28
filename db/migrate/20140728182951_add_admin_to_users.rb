class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, defaault: false
  end
end
