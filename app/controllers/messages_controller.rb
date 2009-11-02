class MessagesController < ApplicationController
  before_filter :get_channel

  def create
    @message = Message.new(params[:message])
    @message.channel = @channel
    @message.nickname = session[:nickname] || request.ip
    respond_to do |format|
      if @message.save
        send_message_via_orbited @message
        format.js
        format.html { redirect_to(slug_path(@channel.slug)) }
      else
        format.html { render :action => "new" }
      end
    end
  end


  private
  
  def get_channel
    @channel = Channel.find(params[:channel_id])
  end
  
  def send_message_via_orbited(message)
    orbited_data = render_to_string :update do |page|
      page.insert_html :bottom, 'messages', :partial => 'channels/message', :locals => {:message => message}
      page['message_form'].down('form').reset
    end
    Orbited.send_data(message.channel.name, orbited_data)
  end
end
