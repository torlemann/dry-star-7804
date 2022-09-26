require 'rails_helper'

RSpec.describe Patient do
  it {should have_many :doctor_patients}
  it {should have_many(:doctors).through(:doctor_patients)}

  describe 'class methods' do
    it 'displays adult patients names' do
      patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)
      
      expect(Patient.adult_patients).to eq(["Denny Duquette", "Katie Bryce", "Rebecca Pope"])
    end
  end
end
