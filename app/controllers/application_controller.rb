class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def format_duration(seconds)
    # seconds must be < to 24 hours
    if seconds.zero?
      Time.at(rand(36_000..72_000)).utc.strftime("%Hh")
    # elsif seconds < 3600
    #   Time.at(seconds).utc.strftime("%Mmin")
    else
      Time.at(seconds).utc.strftime("%Hh")
    end
  end
end
