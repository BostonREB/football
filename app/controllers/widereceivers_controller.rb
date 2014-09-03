class WiderecieversController < ApplicationController

  def index
    @players = find_receivers
  end

  private

  def find_receivers
    Player.where(position: "WR")
  end
end
