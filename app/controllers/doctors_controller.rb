class DoctorsController < ApplicationController
    def show
        @doctor = Doctor.find(params[:id])
        @patients = Patient.all
    end

    def create
        doctor = Doctor.find(params[:id])
        DoctorPatient.create!(doctor_patient_params)
        redirect_to doctor_path(doctor)
    end

    def destroy
        @doctor = Doctor.find(params[:id])
        @patient = DoctorPatient.find_by(params[:patient_id])
        @patient.destroy
        redirect_to doctor_path(@doctor)
    end

    private
    def doctor_patient_params
        params.permit(:patient_id, :doctor_id)
    end

end