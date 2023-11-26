# app/admin/doctors.rb
ActiveAdmin.register Doctor do
  permit_params :email, :full_name, :city, :age, :phone, :category_id, :password, :password_confirmation



  filter :category_id_eq, as: :select, collection: -> { Category.pluck(:title, :id) }

  form do |f|
    f.inputs "Doctor Details" do
      f.input :email
      f.input :full_name
      f.input :city
      f.input :age
      f.input :phone
      f.input :category_id, as: :select, collection: Category.all, prompt: "Select category"
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
