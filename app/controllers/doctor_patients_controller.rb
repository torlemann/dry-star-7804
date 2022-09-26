class DoctorPatientsController < ApplicationController
    def destroy
        @doctor = Doctor.find(params[:id])
        @patient = DoctorPatient.find_by(params[:patient_id])
        @patient.destroy
        redirect_to doctor_path(@doctor)
    end
  
  end