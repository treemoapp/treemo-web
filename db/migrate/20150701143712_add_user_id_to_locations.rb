class AddUserIdToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :user, index: true, foreign_key: true
  end
end
