class DoctorsController < ApplicationController

  def index
    @categories = Category.all
    category_id = params[:category_id]

    if category_id.present?
      @doctors = Doctor.where(category_id: category_id)
    else
      @doctors = Doctor.all
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
    @appointments = @doctor.appointments
  end
end


