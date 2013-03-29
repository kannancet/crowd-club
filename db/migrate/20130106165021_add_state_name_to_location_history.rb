class AddStateNameToLocationHistory < ActiveRecord::Migration
  def change
    add_column :location_histories, :state_name, :string
  end
end
