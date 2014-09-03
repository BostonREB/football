class RunningbacksController < ApplicationController

  def index
    @players = find_running_backs
  end

  private

  def find_running_backs
    Player.where(position: "RB")
  end
end
