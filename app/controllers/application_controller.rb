class ApplicationController < ActionController::Base
  before_action :current_user
  before_filter :process_analytics
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def process_analytics
    unless cookies[:repeat_user]
      if current_user
        if current_user.cookie_id
          cookies[:user_id] = current_user.cookie_id
        else
          this_id = Time.now + rand(1000)
          cookies[:user_id] = this_id
          current_user.cookie_id = this_id
          current_user.save
        end
        cookies[:repeat_user] = {value: true, expires: Time.now + 1.year }
      else
        AnalyticsRecord.event(:new_visitor, request.remote_ip)
        cookies[:repeat_user] = {value: true, expires: Time.now + 1.year }
      end
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end

