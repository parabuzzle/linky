class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :human_time

  def human_time(time)
    time.strftime("%m/%d/%Y %I:%M %p")
  end

end
