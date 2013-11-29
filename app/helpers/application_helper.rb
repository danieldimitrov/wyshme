module ApplicationHelper

  def angular_controller
    "#{params[:controller].capitalize}Ctrl"
  end

end
