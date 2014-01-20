#require 'spec_helper'
#
#describe "StaticPages" do
#  #describe "GET /static_pages" do
#  describe "Home page" do
#    it "works! (now write some real specs)" do
#      #visit static_pages_index_path
#      visit '/static_pages/home'
#      #response.status.should be(200)
#      expect(page).to have_content('Sample App')
#    end
#  end
#  describe "Help page" do
#    it "works! (now write some real specs)" do
#      #visit static_pages_index_path
#      visit '/static_pages/help'
#      #response.status.should be(200)
#      expect(page).to have_content('help')
#    end
#  end
#  describe "About page" do
#
#    it "should have the content 'About Us'" do 
#      visit '/static_pages/about'
#      expect(page).to have_content('About Us')
#    end
#  end
#end
#
 require 'spec_helper'
 
 describe "Static pages" do
   #integrate_views
   #For Rspec2, replace integrate_views with render_views
   #render_views
   #https://www.ruby-forum.com/topic/139941#621914 
   #integrate_views
 
   describe "Home page" do
 
     it "should have the h1 'Sample App'" do
       visit '/static_pages/home'
       page.should have_selector('h1', :text => 'Sample App')
     end
 
     it "should have the title 'Home'" do
       visit '/static_pages/home'
       #page.should have_selector('title',
       #                  :text => "Ruby on Rails Tutorial Sample App | Home")
       expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
     end
   end

  describe "Help page" do

    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      #page.should have_selector('title',
      #                  :text => "Ruby on Rails Tutorial Sample App | Help")
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
    end
  end

  describe "About page" do

    it "should have the h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      #integrate_views
      visit '/static_pages/about'
      #page.should have_selector('title',
      #              :text => "Ruby on Rails Tutorial Sample App | About Us")
      #page.should have_content("About Us")
      #page.should have_css('title', :text => 'Ruby on Rails Tutorial Sample App | About Us')
      #response.should have_selector("title", :content => "Ruby on Rails Tutorial Sample App | About Us")
      #response.should have_selector("title:contains('Ruby on Rails Tutorial Sample App | About Us')")
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About Us")
    end
  end
end