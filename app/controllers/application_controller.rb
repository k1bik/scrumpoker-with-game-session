class ApplicationController < ActionController::Base
  helper_method :current_user

  rescue_from ActiveModel::ValidationError do |exception|
    redirect_to root_path, alert: exception.message
  end

  def turbo_visit(url, frame: nil, action: nil)
    options = {frame: frame, action: action}.compact
    turbo_stream.append_all("head") do
      helpers.javascript_tag(<<~SCRIPT.strip, nonce: true, data: {turbo_cache: false})
        window.Turbo.visit("#{helpers.escape_javascript(url)}", #{options.to_json})
        document.currentScript.remove()
      SCRIPT
    end
  end

  def redirect_to(options = {}, response_options = {})
    turbo_frame = response_options.delete(:turbo_frame)
    turbo_action = response_options.delete(:turbo_action)
    return super unless request.format.turbo_stream? && turbo_frame.present?

    allow_other_host = response_options.delete(:allow_other_host) { _allow_other_host }
    location = _enforce_open_redirect_protection(_compute_redirect_to_location(request, options), allow_other_host: allow_other_host)

    self.class._flash_types.each do |flash_type|
      if (type = response_options.delete(flash_type))
        flash[flash_type] = type
      end
    end

    if (other_flashes = response_options.delete(:flash))
      flash.update(other_flashes)
    end

    render turbo_stream: turbo_visit(location, frame: turbo_frame, action: turbo_action)
  end

  private

  def authenticate_user
    redirect_to new_session_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
