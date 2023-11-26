class AddStatusToRecommendations < ActiveRecord::Migration[7.0]
  def change
    add_column :recommendations, :status, :string, default: 'open'
  end
end
