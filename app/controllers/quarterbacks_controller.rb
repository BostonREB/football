class QuarterbacksController < ApplicationController

  def index
    @players = find_quarterbacks
  end

  private

  def find_quarterbacks
    Player.where(position: "QB")
  end
end
