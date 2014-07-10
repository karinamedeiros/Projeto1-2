require 'spec_helper'

describe Patient do

  before do
    @patient = Patient.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  subject { @patient }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
   it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "when name is not present" do
    before { @patient.name = "a" * 51}
    it { should_not be_valid }
  end

   describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[patient@foo,com patiente_at_foo.org example.patient@foo.
                     pac@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @patient.email = invalid_address
        expect(@patient).not_to be_valid
      end
    end
end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[patient@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @patient.email = valid_address
        expect(@patient).to be_valid
      end
    end
   end

   describe "when email address is already taken" do
    before do
     patient_with_same_email = @patient.dup
     patient_with_same_email.email = @patient.email.upcase
     patient_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @patient= Patient.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @patient_password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
  	before { @patient.save }
  	let(:found_patient) { Patient.find_by(email: @patient.email) }
  end
  
  describe "with valid password" do
    it { should eq found_patient.authenticate(@patient.password) }
  end

  describe "with invalid password" do
    let(:patient_for_invalid_password) { found_patient.authenticate("invalid") }

    it { should_not eq patient_for_invalid_password }
    specify { expect(patient_for_invalid_password).to be_false }
  end

end
