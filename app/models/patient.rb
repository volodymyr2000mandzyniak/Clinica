class Patient < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments


  def self.ransackable_attributes(auth_object = nil)
    ["age", "city", "created_at", "email", "encrypted_password", "full_name", "id", "phone", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end

end
