require 'spec_helper'

describe "Pacients pages" do

  subject { page }

  describe "register page" do
    let(:pacient) { FactoryGirl.create(:pacient) }
    before { visit pacient_path(pacient) }

    it { should have_content(pacient.name) }
    it { should have_title(pacient.name) }
  end

  describe "Register" do
    before { visit register_path }

    it { should have_content('Registrar') }
    it { should have_title(full_title('Registrar')) }
  end

  describe "Register" do

    before { visit register_path }

    let(:submit) { "Registrar paciente" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Pacient, :count)
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
        expect { click_button submit }.to change(Pacient, :count).by(1)
      end
    end
  end

end