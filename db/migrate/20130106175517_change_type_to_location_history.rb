class ChangeTypeToLocationHistory < ActiveRecord::Migration
  def change
    change_table :location_histories do |t|  
      t.change :history_latitude, :decimal
      t.change :history_longitude, :decimal
    end
    change_table :users do |t|  
      t.change :latitude, :decimal
      t.change :longitude, :decimal
    end
  end
end
