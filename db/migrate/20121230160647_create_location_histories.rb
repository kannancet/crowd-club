class CreateLocationHistories < ActiveRecord::Migration
  def change
    create_table :location_histories do |t|
      t.float :history_latitude
      t.float :history_longitude
      t.text :history_address

      t.timestamps
    end
  end
end
