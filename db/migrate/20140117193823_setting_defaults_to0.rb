class SettingDefaultsTo0 < ActiveRecord::Migration
  def change
    change_column :tallys, :unique, :integer, default: 0
    change_column :tallys, :mobile, :integer, default: 0
    change_column :tallys, :firefox, :integer, default: 0
    change_column :tallys, :chrome, :integer, default: 0
    change_column :tallys, :internet_explorer, :integer, default: 0
    change_column :tallys, :safari, :integer, default: 0
    change_column :tallys, :other_browser, :integer, default: 0
    change_column :tallys, :user_views, :integer, default: 0
    change_column :tallys, :product_views, :integer, default: 0
    change_column :tallys, :order_views, :integer, default: 0
    change_column :tallys, :static_views, :integer, default: 0
    change_column :tallys, :stat_views, :integer, default: 0
    change_column :tallys, :other_views, :integer, default: 0
    change_column :tallys, :total_views, :integer, default: 0
  end
end
