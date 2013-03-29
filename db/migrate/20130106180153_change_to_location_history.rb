class ChangeToLocationHistory < ActiveRecord::Migration
  def change
    change_table :location_histories do |t|  
      t.change :history_latitude, :float
      t.change :history_longitude, :float
    end
    change_table :users do |t|  
      t.change :latitude, :float
      t.change :longitude, :float
    end
  end
end
