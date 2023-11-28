class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :category
  has_many :appointments

  validates :email, :phone, :full_name, :age, :city, presence: true
  validates :phone, uniqueness: true

  def email_required?
   false
  end

  def email_changed?
   false
  end
  def self.ransackable_attributes(auth_object = nil)
    ["age", "categor_id", "category_id", "city", "created_at", "email", "encrypted_password", "full_name", "id", "phone", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end


end
