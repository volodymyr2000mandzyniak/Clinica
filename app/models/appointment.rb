class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_one :recommendation

  scope :closed, -> { where(status: 'closed') }


end
