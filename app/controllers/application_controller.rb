class ApplicationController < ActionController::Base
  protect_from_forgery :except => :update_my_location
  #before_filter :clear_all_flash
  before_filter :assign_logged_in_user, :update_user_location, :set_menu_color

=begin
  This function is used to clear all flash. 
=end 
  def clear_all_flash
    flash[:notice] = flash[:alert] = flash[:error] = nil
  end 
=begin
  This function is used to assign logged in user. 
=end
  def assign_logged_in_user
    LOGGED_IN_USER[:user] = current_user
  end
 
=begin
  This function is used set the confirmation token.
  Used for creating confirmation token on user creation.
=end  
  def set_confirmation_token
    SecureRandom.hex(16)
  end
  
=begin
  This function is used to update the location on each request.
=end
  def update_user_location
    my_ip = "117.196.159.121" if request.ip == "127.0.0.1"
    if current_user && (current_user.last_sign_in_ip != my_ip)
      current_user.update_attributes(:last_sign_in_ip => my_ip)
      @geolocator = Google::Geolocator.new(my_ip, current_user)
      unless @geolocator.update_location
        flash[:error] = "Sorry, We are unable to track you location due to connectivity problems. Please update your location to continue." 
      end
    end
  end

=begin
  This function is used to set the menu color. 
=end
  def set_menu_color
    @me_tab, @explore_tab, @feed_tab, @buddy_tab = '', '', '', ''
    if request.fullpath.include?("me")
      @me_tab = "color: #37be7b;"
    elsif request.fullpath.include?("explore")
      @explore_tab = "color: #37be7b;"
    elsif request.fullpath.include?("feeds")
      @feed_tab = "color: #37be7b;"
    elsif request.fullpath.include?("buddies")
      @buddy_tab = "color: #37be7b;"
    end
  end
end
