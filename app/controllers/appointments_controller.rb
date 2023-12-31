class AppointmentsController < ApplicationController
  before_action :authenticate_patient!, only: [:new, :create]

  def index
    if doctor_signed_in?
      @appointments = current_doctor.appointments
    elsif patient_signed_in?
      @appointments = current_patient.appointments
    else
      redirect_to root_path, alert: 'Access denied.'
    end
  end


  def new
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = @doctor.appointments.new
  end

  def create
    @doctor = Doctor.find(params[:doctor_id])

    if @doctor.appointments.where(status: 'open').count >= 10
      redirect_to root_path, alert: 'Doctor has reached the limit of open appointments.'
    else
      @appointment = @doctor.appointments.new(appointment_params)
      @appointment.patient = current_patient

      if @appointment.save
        redirect_to patient_path(current_patient), notice: 'Appointment created successfully.'
      else
        render :new
      end
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    @recommendation = @appointment.recommendation
  end

  def closed_appointments
    @appointments = current_doctor ? current_doctor.appointments.closed : current_patient.appointments.closed

  end


  def close
    @appointment = Appointment.find(params[:id])
    @appointment.update(status: 'closed')

    redirect_to patient_path(current_patient), notice: 'Appointment closed successfully.'
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :problem)
  end
end
