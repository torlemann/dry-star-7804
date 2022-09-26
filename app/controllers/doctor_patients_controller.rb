class DoctorPatientsController < ApplicationController
    def delete
        patient = DoctorPatient.find(params[:id])
        patient.destroy
        redirect_to '/doctors/:doctor_id'
    end
  
  end