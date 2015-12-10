class Membership < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :user
  validates :meetup_id, presence: true, uniqueness: {scope: :user_id}
end
