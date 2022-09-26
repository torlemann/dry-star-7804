require 'rails_helper'

RSpec.describe 'Patient Index Page' do 
  it "shows names of adult patients" do 
      patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)
      visit "/patients"

      expect(page).to have_content("Katie")
      expect(page).to have_content("Denny Duquette")
      expect(page).to have_content("Rebecca Pope")
      expect(page).to_not have_content("Zola Shepherd")
    end
end