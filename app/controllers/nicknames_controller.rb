class NicknamesController < ApplicationController

  def create
    session[:nickname] = params[:nickname] if params[:nickname]
    respond_to do |format|
      format.js
      format.html { redirect_to :back }
    end
  end
  
end
