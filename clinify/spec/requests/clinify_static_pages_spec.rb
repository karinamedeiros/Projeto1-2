require 'spec_helper'

describe "Clinify static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Kefisio') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end
  

   describe "Help page" do
    before { visit help_path }

    it { should have_content('Ajuda') }
    it { should have_title(full_title('Ajuda')) }
  end
  

  describe "About page" do
    before { visit about_path }

    it { should have_content('Sobre nós') }
    it { should have_title(full_title('Sobre nós')) }
  end

  describe "Login page" do
    before { visit login_path }

    it { should have_content('Login') }
    it { should have_title(full_title('Login')) }
   end
end

