class AddUserIdToLocationHistory < ActiveRecord::Migration
  def change
    add_column :location_histories, :user_id, :integer
  end
end
