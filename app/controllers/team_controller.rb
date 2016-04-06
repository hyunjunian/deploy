class TeamController < ApplicationController
  before_action :authenticate_user!

  def index
    @team = current_user.teams
    @user = User.all
  end
  def create
    team = Team.new(:teamname => params[:teamname])
    team.users << current_user
    team.users << User.where(:id => params[:user_ids])
    if team.save
      redirect_to :root
    end
  end
end
