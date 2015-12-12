require 'spec_helper'
require 'capybara/rails'

RSpec.describe FoodsController, :type => :controller do
  Capybara.run_server = false
  Capybara.app_host = 'http://localhost:3000'
  Capybara.default_selector = :xpath
  describe "The food creation page" do
    Capybara.visit '/foods/new'

    it "should show the food creation form" do
      expect(Capybara.page.has_selector? :xpath, '//*[@id="new_food"]').to be true
    end
    
    it "should allow me to fill-in information about a new food" do
      test_food = attributes_for(:food)
      test_components = attributes_for(:component)
      Capybara.page.fill_in 'food_name', :with => test_food[:name]
      Capybara.page.fill_in 'food_description', :with => test_food[:description]
      Capybara.page.fill_in 'food_properties', :with => test_food[:properties]
      Capybara.page.find :xpath, '//*[@id="Protein1"]'
      expect(true).to be true
    end

  describe "Food display page" do
    it "should show the food search form" do
    end
    it "should show the results page" do
    end

  end

  describe "Food update page" do
    it "should show the food update form" do
    end
    it "should save the changes introduced in the form" do
    end
    it "should show a pop up window with a success message" do
    end
  end

end

