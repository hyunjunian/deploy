class WhiteboardController < ApplicationController
  def update
    @whiteboard = Whiteboard.find(params[:whiteboardid])
    @whiteboard.content = params[:content]
    @whiteboard.user = current_user
    @chat = @whiteboard.chat
    @whiteboard.edit = true
    if @whiteboard.save
      @message = Message.new(:content => "Whiteboard has been Changed")
      @message.user = current_user
      @message.chat = @whiteboard.chat
      @message.save
      sync_new @message, scope: @chat, partial: 'newmessages'
      sync_update @whiteboard, scope: @chat, partial: 'whiteboardedit'
      respond_to do |format|
        format.js
      end
    end


  end
end
