class ProTeam < ActiveRecord::Base
  attr_reader :player

  has_many :players

end
