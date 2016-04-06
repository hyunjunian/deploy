class ChatController < ApplicationController
  def create
    @chat = Chat.new(:title => params[:title])
    @team = Team.find(params[:team])
    @team.chats << @chat
    @team.save
    @chat.users << current_user
    @chat.users << User.where(:id => params[:user_ids])
    if @chat.save
      redirect_to action: 'show', team: params[:team]
    end
  end
  def show
    @team = Team.find(params[:team])
    @chat = @team.chats
  end

end
