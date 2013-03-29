class MeController < ApplicationController
  before_filter :authenticate_user!
  layout false, :only => :my_map

=begin
  This function is used to update user location. 
=end  
  def index
    session[:first_login] = nil
  end

=begin
  This function is used to update user location. 
=end  
  def my_map
    @user = current_user
  end
  
=begin
  This function is used to update user location. 
=end
  def update_my_location
    search_position = "#{params['new_lat']},#{params['new_lng']}"
    @geolocator = Google::Geolocator.new(search_position, current_user)
    render :json =>  @geolocator.update_location
  end
  
end
