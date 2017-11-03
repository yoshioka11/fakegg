class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @members = Player.where(team_id: params[:team][:id])
  end
end
