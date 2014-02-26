require 'spec_helper'

describe "StaticPages" do
  let(:base_title) { "Food App" }
  
  describe "Home page" do
  	it "should have the content 'Food App'" do
      visit root_path
      expect(page).to have_content('Food Place')
    end

    it "should have the title 'Home'" do
      visit root_path
      expect(page).to have_title("#{base_title} | Home")
    end
  end

  describe "About page" do
  	it "should have the content 'About Food App'" do
  	  visit about_path
  	  expect(page).to have_content('About')
  	end

  	it "should have the title 'About'" do
  	  visit about_path
  	  expect(page).to have_title("#{base_title} | About")
  	end
  end

  describe "Contact page" do
    it "should have the content 'Contact us'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title("#{base_title} | Contact")
    end
  end
end
