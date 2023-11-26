class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.text :content
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
