require 'rails_helper'

RSpec.describe 'Doctor Show Page' do 
  it "has all of the doctor's atrributes and relationships" do 
    hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    doctor_1 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital_id: hospital_1.id)
    doctor_2 = Doctor.create!(name: "Meredith Gray", specialty: "General Surgery", university: "Harvard University", hospital_id: hospital_1.id)

    patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
    patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
    patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
    patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)

    doctor_patient_1 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_1.id)
    doctor_patient_2 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_2.id)
    doctor_patient_3 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_3.id)

    #visit "/doctors/#{doctor_1.id}"
    visit doctor_path(doctor_1)

    expect(page).to have_content(doctor_1.name)
    expect(page).to have_content(doctor_1.specialty)
    expect(page).to have_content(doctor_1.university)
    expect(page).to have_content("Grey Sloan Memorial Hospital")
    expect(page).to have_content("Katie Bryce")
    expect(page).to have_content("Denny Duquette")
    expect(page).to have_content("Rebecca Pope")
    expect(page).to_not have_content("Zola Shepherd")
  end

  it "can remove patient from doctor's care" do 
    hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    doctor_1 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital_id: hospital_1.id)

    patient_1 = doctor_1.patients.create!(name: "Katie Bryce", age: 24)

    visit doctor_path(doctor_1)

    within(".patient-#{patient_1.id}") do
        expect(page).to have_content("Katie Bryce")
        expect(page).to have_button("Remove #{patient_1.name}")
        click_button "Remove #{patient_1.name}"
        expect(current_path).to eq(doctor_path(doctor_1))
    end
    expect(page).to_not have_content("Katie Bryce")
  end


  it "has a form that can add a patient to doctor's care" do 
    hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    doctor_1 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital_id: hospital_1.id)

    patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
    patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
    patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
    patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)

    doctor_patient_1 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_1.id)

    visit doctor_path(doctor_1)

    expect(page).to have_content("Katie Bryce")
    expect(page).to_not have_content("Denny Duquette")

    fill_in :patient_id, with: "#{patient_1.id}"
    click_button "Submit"

    expect(current_path).to eq(doctor_path(doctor_1))
    expect(page).to have_content("Denny Duquette")
  end
end