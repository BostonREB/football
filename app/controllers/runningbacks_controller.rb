class RunningbacksController < ApplicationController

  def index
    @players = find_running_backs
  end

  private

  def find_running_backs
    Ranking.where("position == 'RB'").map(&:player)
  end
end
