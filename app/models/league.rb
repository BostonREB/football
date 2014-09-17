class League < ActiveRecord::Base
  belongs_to :user

  has_many :teams

  has_many :league_memberships
  has_many :users,
    through: :league_memberships

end
