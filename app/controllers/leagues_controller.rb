class LeaguesController < ApplicationController

  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    if @league.save
      current_user.join @league
      redirect_to @league
    else
      render :new
    end
  end

  def show
    @league = League.find(params[:id])
    @teams = @league.teams.includes(league: [:user])
  end

  private

  def league_params
    params.require(:league).permit(:name, :team_limit)
  end

end
