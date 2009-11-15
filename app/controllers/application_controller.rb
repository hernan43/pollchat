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

  def set_color
    colors = [
      '#fec94f',
      '#edd400',
      '#c4a000',
      '#fcaf3e',
      '#f57900',
      '#ce5c00',
      '#e9b96e',
      '#c17d11',
      '#8f5902',
      '#8ae234',
      '#73d216',
      '#4e9a06',
      '#729fcf',
      '#3465a4',
      '#204a87',
      '#ad7fa8',
      '#75507b',
      '#5c3566',
      '#cf2929',
      '#cc0000',
      '#a40000',
      '#eeeeec',
      '#d3d7cf',
      '#babdb6'
    ]
    
    session[:color] = colors[rand(colors.length)] if session[:color].nil?
  end

end
