class Client < ApplicationRecord
    has_many :membership
    has_many :gym, through: :membership
end
