module ApplicationHelper
  
  def show_flash_message
      [:error, :warning, :notice].collect do |key|
            content_tag :div, :id => "flash", :class => "flash_#{key}" do
              flash[key]
          end unless flash[key].blank?
      end.join.html_safe
  end
  
  def render_full_name
    current_user.first_name.capitalize + " " + current_user.last_name. capitalize
  end
end
