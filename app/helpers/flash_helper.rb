module FlashHelper
  def render_flash
    render 'application/flash' if can_flash?
  end

  def can_flash?
    flash.keys.sort == ['from', 'full_messages', 'object_id', 'object_type', 'type']
  end

  def flash_object
    flash[:object_type].classify.constantize.where(id: flash[:object_id]).first
  end

  def flash_path
    # File.join(controller_name, 'flash', flash[:from].to_s + '_' + flash[:type].to_s)
    [controller_name, 'flash'].join('/')
  end

  def render_flash_file
    begin
      render flash_path, object: flash_object
    rescue Exception => e
      # if e.class.name == 'ActionView::MissingTemplate'
        # render html: '<h4>Errors</h4>'.html_safe
      # else
        raise e
      # end
    end
  end

  def flash_messages
    flash[:full_messages]
  end
end
