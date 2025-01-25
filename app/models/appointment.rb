class Appointment < ApplicationRecord
  belongs_to :created_by, foreign_key: :created_by_user_id, class_name: "User"

  validates :requested_datetime, presence: true

  def created_by?(user)
    created_by == user
  end
end
