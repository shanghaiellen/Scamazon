class AddingGenericTallyInfo < ActiveRecord::Migration
  def change
    create_table :tallys do |t|
      t.integer :unique
      t.integer :mobile
      t.integer :firefox
      t.integer :chrome
      t.integer :internet_explorer
      t.integer :safari
      t.integer :other_browser
      t.integer :user_views
      t.integer :product_views
      t.integer :order_views
      t.integer :static_views
      t.integer :stat_views
      t.integer :other_views
      t.integer :total_views
    end
  end
end
