class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = current_patient
    @active_appointments = current_patient.appointments.where(status: 'open')
    @closed_appointments = current_patient.appointments.where(status: 'closed')
  end

end
