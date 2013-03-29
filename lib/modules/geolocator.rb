module Google
  class Geolocator
    attr_accessor :search_param, 
                  :user, 
                  :data

=begin
  This function is used to initialize the geolocator class. 
=end    
    def initialize(search_param, user)
      @search_param = search_param
      @user = user
      @data = nil
    end

=begin
  This function is used to update user location and location history based on search. 
=end    
    def update_location
      #begin
         @gelocation = Geocoder.search(search_param).first
         if @gelocation && @gelocation.latitude && @gelocation.longitude
           location_history = LocationHistory.find_by_history_address(@gelocation.address)
           if location_history.nil?
             location_history = LocationHistory.create(:city => @gelocation.city,
                                                       :country_name => @gelocation.country,
                                                       :state_name => @gelocation.state,
                                                       :history_latitude => @gelocation.latitude,
                                                       :history_longitude => @gelocation.longitude,
                                                       :history_address => @gelocation.address,
                                                       :user_id => user.id
                                                       )
            end
              user.update_attributes(:current_location_id => location_history.id,
                                     :latitude => location_history.history_latitude,
                                     :longitude => location_history.history_longitude,
                                     :address => location_history.history_address)
            self.data = @gelocation
            return true
         else
            return false
         end
       # rescue Exception => e
         # return false
       # end 
     end   
  end
end