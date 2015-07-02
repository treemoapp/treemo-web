class ChangeFacebookIdInLocations < ActiveRecord::Migration
  def change
    change_column :locations, :facebook_id, :integer, :limit => 8
  end
end
