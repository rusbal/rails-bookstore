class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_flash(type, object: nil)
    p "**** DEBUG: Ray ****"
    p action_name
    p object
    p "**** END: Ray ****"
    flash[:from] = action_name
    flash[:type] = type
    flash[:object_type] = object.class.name
    flash[:object_id] = object.id

    if object.errors.any?
      flash[:full_messages] = object.errors.full_messages
    end
  end
end
