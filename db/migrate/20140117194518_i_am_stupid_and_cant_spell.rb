class IAmStupidAndCantSpell < ActiveRecord::Migration
  def change
    rename_table :tallys, :tallies
  end
end
