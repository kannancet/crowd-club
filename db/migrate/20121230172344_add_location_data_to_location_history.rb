class AddLocationDataToLocationHistory < ActiveRecord::Migration
  def change
    add_column :location_histories, :city, :string
    add_column :location_histories, :region_code, :string
    add_column :location_histories, :region_name, :string
    add_column :location_histories, :metrocode, :string
    add_column :location_histories, :zipcode, :string
    add_column :location_histories, :country_name, :string
    add_column :location_histories, :country_code, :string
  end
end
