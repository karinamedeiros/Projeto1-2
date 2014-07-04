require 'spec_helper'

describe Pacient do

  before do
    @pacient = Pacient.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  subject { @pacient }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
   it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "when name is not present" do
    before { @pacient.name = "a" * 51}
    it { should_not be_valid }
  end

   describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[pacient@foo,com paciente_at_foo.org example.pacient@foo.
                     pac@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @pacient.email = invalid_address
        expect(@pacient).not_to be_valid
      end
    end
end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[pacient@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @pacient.email = valid_address
        expect(@pacient).to be_valid
      end
    end
   end

   describe "when email address is already taken" do
    before do
     pacient_with_same_email = @pacient.dup
     pacient_with_same_email.email = @pacient.email.upcase
     pacient_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @pacient= Pacient.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @pacient_password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
  	before { @pacient.save }
  	let(:found_pacient) { Pacient.find_by(email: @pacient.email) }
  end
  
  describe "with valid password" do
    it { should eq found_pacient.authenticate(@pacient.password) }
  end

  describe "with invalid password" do
    let(:pacient_for_invalid_password) { found_pacient.authenticate("invalid") }

    it { should_not eq pacient_for_invalid_password }
    specify { expect(pacient_for_invalid_password).to be_false }
  end

end
