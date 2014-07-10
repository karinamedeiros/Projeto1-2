require 'spec_helper'

describe "Patients pages" do

  subject { page }

  describe "register page" do
    let(:patient) { FactoryGirl.create(:patient) }
    before { visit patient_path(patient) }

    it { should have_content(patient.name) }
    it { should have_title(patient.name) }
  end

  describe "Register" do
    before { visit register_path }

    it { should have_content('Registrar') }
    it { should have_title(full_title('Registrar')) }
  end

  describe "Register" do

    before { visit register_path }

    let(:submit) { "Registrar patiente" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Patient, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Karina Medeiros "
        fill_in "Email",        with: "karina.medeiros07@gmail.com"
        fill_in "Password",     with: "123456"
        fill_in "Confirmation", with: "123456"
      end

      it "should create a user" do
        expect { click_button submit }.to change(Patient, :count).by(1)
      end
    end
  end

end