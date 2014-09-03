class KickersController < ApplicationController

  def index
    @players = find_kickers
  end

  private

  def find_kickers
    Player.where(position: "K")
  end
end
