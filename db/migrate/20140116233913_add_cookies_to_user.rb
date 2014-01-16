class AddCookiesToUser < ActiveRecord::Migration
  def change
    add_column :users, :cookie_id, :integer
  end
end
