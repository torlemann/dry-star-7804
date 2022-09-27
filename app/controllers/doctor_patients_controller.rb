class DoctorPatientsController < ApplicationController
    def create
        doctor = Doctor.find(params[:doctor_id])
        doctor.doctor_patients.create
        redirect_to doctor_path(doctor)
    end
  
end