module ApplicationHelper
  def flash_notice
    if flash[:notice].present?
      ( '<div id="flash-notice" class="flash">' + 
          flash[:notice] + 
        '</div>' ).html_safe
    elsif flash[:alert].present?
      ( '<div id="flash-alert" class="flash">' + 
          flash[:alert] + 
        '</div>' ).html_safe
    end
  end
end

