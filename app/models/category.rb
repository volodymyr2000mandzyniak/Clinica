class Category < ApplicationRecord
    has_many :doctors

    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "id", "title", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["doctors"]
    end
end
