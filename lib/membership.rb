class Membership
  attr_reader :cost
  attr_accessor :member, :gym

  @@all = []

  def initialize(gym, member, cost)
    @cost = cost
    @gym = gym
    @member = member
    @@all << self
  end

  # - Get a list of all memberships
  def self.all
    @@all
  end
end
