module MeHelper
  
=begin
 This function is used to render the stars to show the user rating. 
=end
  def render_rating
    stars = []
    (current_user.user_rating.to_i).times { stars << image_tag("star_g.png", :border => "0", :width => "25", :height => "25") }
    (5 - current_user.user_rating.to_i).times { stars << image_tag("star_gry.png", :border => "0", :width => "25", :height => "25") }
    content_tag :div, stars.join("\n").html_safe, :class => "star"
  end
  
=begin
  This function is used to create display name. 
=end
  def display_user_name
    current_user.first_name + (current_user.last_name ||= "")
  end
  
=begin
  This function is used to get gmap api. 
=end
  def get_static_gmap
    "http://maps.googleapis.com/maps/api/staticmap?center=#{current_user.address}&zoom=13&size=600x400&maptype=roadmap&markers=color:green|label:G|#{current_user.latitude},#{current_user.longitude}&sensor=false&key=AIzaSyBaYepl61zkgz34rDEjpUIPQwQySyOC0AI"
  end
end
