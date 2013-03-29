class LocationHistory < ActiveRecord::Base
  attr_accessible :city, 
                  :region_code, 
                  :region_name, 
                  :metrocode, 
                  :zipcode, 
                  :country_name, 
                  :state_name,
                  :country_code, 
                  :user_id,
                  :history_address, 
                  :history_latitude, 
                  :history_longitude
  belongs_to :user
end
