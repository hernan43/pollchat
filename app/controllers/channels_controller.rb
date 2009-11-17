class ChannelsController < ApplicationController
  # GET /channels
  # GET /channels.xml
  def index
    @channels = Channel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @channels }
    end
  end

  # GET /channels/1
  # GET /channels/1.xml
  def show
    @channel = Channel.find_or_create_by_slug(params[:slug])
    @message = Message.new

    respond_to do |format|
      format.csv { 
        send_data channel_to_csv(@channel),
          :type => "text/plain",
          :filename => "#{@channel.slug}.csv",
          :disposition => 'inline'
      }
      format.html # show.html.erb
      format.xml  { render :xml => @channel }
    end
  end

  # GET /channels/new
  # GET /channels/new.xml
  def new
    @channel = Channel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @channel }
    end
  end

  # GET /channels/1/edit
  def edit
    @channel = Channel.find(params[:id])
  end

  # POST /channels
  # POST /channels.xml
  def create
    @channel = Channel.new(params[:channel])

    respond_to do |format|
      if @channel.save
        #flash[:notice] = 'Channel was successfully created.'
        format.html { redirect_to(slug_path(@channel.slug)) }
        format.xml  { render :xml => @channel, :status => :created, :location => @channel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @channel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /channels/1
  # PUT /channels/1.xml
  def update
    @channel = Channel.find(params[:id])

    respond_to do |format|
      if @channel.update_attributes(params[:channel])
        flash[:notice] = 'Channel was successfully updated.'
        format.html { redirect_to(@channel) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @channel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.xml
  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy

    respond_to do |format|
      format.html { redirect_to(channels_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def channel_to_csv(channel)
    FasterCSV.generate do |csv|
      csv << ["created_at", "nickname", "message"]
      channel.messages.each do |message|
        csv << [message.created_at, message.nickname, message.content]
      end
    end
  end
end
