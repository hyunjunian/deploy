class MessageController < ApplicationController
  def show
    @chat = Chat.find(params[:chat])

  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.chat = Chat.find(params[:message][:chat_id])
    @chat = @message.chat
    if @message.save
      sync_new @message, scope: @chat
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :chat_id)
  end
end
