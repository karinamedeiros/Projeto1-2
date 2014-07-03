require 'spec_helper'

describe "ClinifyStaticPages" do
  describe "Home page" do

    it "should have the content 'Kefisio'" do
      visit '/clinify_static_pages/home'
      expect(page).to have_content('Kefisio')
    end

    it "should have the title 'Home'" do
      visit '/clinify_static_pages/home'
      expect(page).to have_title("Kefisio | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'Ajuda'" do
      visit '/clinify_static_pages/help'
      expect(page).to have_content('Ajuda')
    end

    it "should have the title 'Ajuda'" do
      visit '/clinify_static_pages/help'
      expect(page).to have_title("Kefisio | Ajuda")
    end
  end

  describe "About page" do

    it "should have the content 'Sobre nós'" do
      visit '/clinify_static_pages/about'
      expect(page).to have_content('Sobre nós')
    end

    it "should have the title 'Sobre nós'" do
      visit '/clinify_static_pages/about'
      expect(page).to have_title("Kefisio | Sobre nós")
    end
  end

  describe "Login page" do

    it "should have the content 'Login'" do
      visit '/clinify_static_pages/login'
      expect(page).to have_content('Login')
    end

    it "should have the title 'Login'" do
      visit '/clinify_static_pages/login'
      expect(page).to have_title("Kefisio | Login")
    end
  end
end
