class Lifter
  attr_reader :name, :lift_total
  attr_accessor :memberships

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    #@memberships = []
    @@all << self
  end

  # - Get a list of all lifters
  def self.all
    @@all
  end

  # - Get a list of all the memberships that a specific lifter has
  def all_memberships
    Membership.all.select do |membership|
      membership.member == self
    end
  end

  # - Get a list of all the gyms that a specific lifter has memberships to
  def all_gyms
    all_gym_array = []
    Membership.all.select do |membership_instance|
      if membership_instance.member == self
        all_gym_array << membership_instance.gym
      end
    end
    all_gym_array
  end

  # - Get the average lift total of all lifters
  def self.average_lift_total
    avg_lift_total = []
    self.all.each do |lifter|
      avg_lift_total << lifter.lift_total
    end
    avg = 0
    i = 0
    while i < avg_lift_total.length
      avg = avg + avg_lift_total[i]
      i += 1
    end
    avg = avg / avg_lift_total.length
    return avg
  end

  # - Get the total cost of a specific lifter's gym memberships
  def total_membership_cost
    total_cost = 0
    Membership.all.select do |membership_instance|
      if membership_instance.member == self
        total_cost += membership_instance.cost
      end
    end
    total_cost
  end

  # - Given a gym and a membership cost, sign a specific lifter up for a new gym
  def add_lifter(gym, cost)
    Membership.new(gym, self, cost)
  end
end
