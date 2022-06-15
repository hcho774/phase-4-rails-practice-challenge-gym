class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    validates :gym_id, :client_id, :charge,  presence: true
    validates :client_id, uniqueness: true
end
