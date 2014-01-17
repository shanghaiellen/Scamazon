class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :get_agent
  before_action :get_tally
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
        @tally.unique += 1
      end
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def get_tally
    if Tally.all.length > 0
      @tally ||= Tally.find(1)
    else 
      @tally = Tally.new
      @tally.id = 1
      @tally.save
    end
  end

  helper_method :current_user

  private
  def get_agent
    get_tally
    if Tally.find(1)
      tally = Tally.find(1)
    else
      tally = Tally.new
      tally.save
    end
    ua = AgentOrange::UserAgent.new(request.user_agent)
    device = ua.device
    if device.is_mobile?
      @tally.mobile += 1
    end
    browser = device.engine.browser
    case browser.name.downcase
    when "internet explorer" then @tally.internet_explorer += 1
    when "chrome" then @tally.chrome += 1
    when "firefox" then @tally.firefox += 1
    when "safari" then @tally.safari += 1
    else @tally.other_browser += 1
    end
    @tally.save
  end
end

