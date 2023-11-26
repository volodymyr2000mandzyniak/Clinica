ActiveAdmin.register Patient do

  filter :full_name, label: 'Full Name'
  filter :city_cont, label: 'City'
  filter :age, label: 'Age'
  filter :phone, label: 'Phone'

  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at

end
