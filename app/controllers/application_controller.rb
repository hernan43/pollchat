# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # before_filter to set/get chat name
  before_filter :set_nickname

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  private
  
  # generate a fake name
  def fake_name
    "#{Faker::Name.first_name}_#{Faker::Name.last_name}"
  end

  # set the chat nickname to a fake one if none exists
  def set_nickname
    session[:nickname] = fake_name if session[:nickname].nil?
  end

end
