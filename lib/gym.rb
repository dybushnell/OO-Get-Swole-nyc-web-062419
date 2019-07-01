class Gym
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  #   - Get a list of all gyms
  def self.all
    @@all
  end

  #   - Get a list of all memberships at a specific gym
  def all_memberships
    Membership.all.select do |membership_instance|
      membership_instance.gym == self
    end
  end

  #   - Get a list of all the lifters that have a membership to a specific gym
  def all_lifters
    Membership.all.select do |membership_instance|
      if membership_instance.gym == self
        membership_instance.member
      end
    end
  end

  #   - Get a list of the names of all lifters that have a membership to that gym
  def all_lifters_names
    aln = []
    Membership.all.select do |membership_instance|
      if membership_instance.gym == self
        aln << membership_instance.member.name
      end
    end
    aln
  end

  #   - Get the combined lift total of every lifter has a membership to that gym
  def combined_lift_total
    clt = 0
    Membership.all.select do |membership_instance|
      if membership_instance.gym == self
        clt += membership_instance.member.lift_total
      end
    end
    clt
  end
end
