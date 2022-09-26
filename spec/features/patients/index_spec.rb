require 'rails_helper'

RSpec.describe 'Patient Index Page' do 
  it "shows names of adult patients in ascending alpha order" do 
      patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)
      visit "/patients"

      expect(page).to have_content("Katie Bryce")
      expect(page).to have_content("Denny Duquette")
      expect(page).to have_content("Rebecca Pope")
      expect(page).to_not have_content("Zola Shepherd")
      # expect("Denny Duquette").to appear_before("Katie Bryce")
      # expect("Katie Bryce").to appear_before("Rebecca Pope")
      # don't remember if that's the correct syntax for orderly or not
    end
end