class Gym < ApplicationRecord
    has_many :Membership
    has_many :client, through: :membership
end
