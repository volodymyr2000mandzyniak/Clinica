class AddNewFieldsToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :full_name, :string
    add_column :patients, :city, :string
    add_column :patients, :age, :integer
    add_column :patients, :phone, :string
  end
end
