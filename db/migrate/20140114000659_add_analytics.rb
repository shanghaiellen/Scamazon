class AddAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics_records do |t|
      t.string :name
      t.string :value
 
      t.timestamps
    end
    add_index :analytics_records, [:name, :value], :unique => true
  end
end
