# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative "../config/environment.rb"

# test code goes here

lifter1 = Lifter.new("Ace", 200)
lifter2 = Lifter.new("Base", 300)
lifter3 = Lifter.new("Case", 400)
gym1 = Gym.new("Uno Gym")
gym2 = Gym.new("Duo Gym")
membership1 = Membership.new(gym1, lifter1, 100)
membership2 = Membership.new(gym2, lifter1, 200)
membership3 = Membership.new(gym1, lifter2, 300)
membership4 = Membership.new(gym2, lifter2, 400)
membership5 = Membership.new(gym1, lifter3, 500)
membership6 = Membership.new(gym2, lifter3, 600)

lifter1.all_memberships
lifter1.all_gyms
Lifter.average_lift_total
lifter1.total_membership_cost

gym1.all_memberships
gym1.all_lifters
gym1.all_lifters_names
#gym1.combined_lift_total

binding.pry

puts "Gains!"
