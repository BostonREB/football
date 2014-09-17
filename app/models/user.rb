class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :teams,
    through: :league,
    dependent: :destroy

  has_many :selected_players, through: :team

  has_many :league_memberships
  has_many :leagues,
    through: :league_memberships,
    dependent: :destroy

  def join(league)
    league_memberships.create(league: league)
  end

  def leave(league)
    membership = LeagueMembership.where(league_id: league.id)
    membership.destroy_all
  end
end
