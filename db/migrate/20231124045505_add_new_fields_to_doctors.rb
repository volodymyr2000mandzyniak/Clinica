class AddNewFieldsToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :full_name, :string
    add_column :doctors, :city, :string
    add_column :doctors, :age, :integer
    add_column :doctors, :phone, :string
  end
end
