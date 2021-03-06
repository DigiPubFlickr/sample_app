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
 #require 'cucumber'
 
 describe "Static pages" do

  #let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  subject { page }
 
  #describe "Home page" do
 
  #  it "should have the h1 'Sample App'" do
  #    visit '/static_pages/home'
  #    page.should have_selector('h1', :text => 'Sample App')
  #  end
 
  #  it "should have the title 'Home'" do
  #    visit '/static_pages/home'
  #    expect(page).to have_title("#{base_title} | Home")
  #  end
  #end

    describe "Home page" do
      before { visit root_path }
      #it "should have the content 'Sample App'" do
      #  #visit '/static_pages/home'
      #  #visit root_path
      #  expect(page).to have_content('Sample App')
      #end
      #it "should have the base title" do
      #  #visit '/static_pages/home'
      #  #visit root_path
      #  expect(page).to have_title("Ruby on Rails Tutorial Sample App")
      #end
      #it "should not have a custom page title" do
      #  #visit '/static_pages/home'
      #  #visit root_path
      #  expect(page).not_to have_title('| Home')
      #end
      it { should have_selector('h1', text: 'Prototype') }
      it { should have_title(full_title('')) }
      it { should_not have_title(full_title('| Home')) }

      describe "for signed-in users" do
        let(:user) { FactoryGirl.create(:user) }
        before do
          FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
          FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
          sign_in user
          visit root_path
        end

        it "should render the user's feed" do
          user.feed.each do |item|
            page.should have_selector("li##{item.id}", text: item.content)
          end
        end
    end

    describe "Static pages" do
      before { visit root_path }
      it "should have the right links on the layout" do
        click_link "Sign up now!"
        page.should have_selector('h1', text:'Sign up' )
        click_link "About"
        page.should have_title full_title('About Us')
        click_link "Help"
        page.should # fill in
        click_link "Contact"
        page.should # fill in
        click_link "Home"
        click_link "Sign up now!"
        page.should # fill in
        #click_link "sample app"
        click_link "Prototype"
        page.should # fill in
      end
    end

  #it "should have the right links on the layout" do
  #  visit root_path
  #  click_link "About"
  #  page.should have_selector 'title', text: full_title('About Us')
  #  click_link "Help"
  #  page.should # fill in
  #  click_link "Contact"
  #  page.should # fill in
  #  click_link "Home"
  #  click_link "Sign up now!"
  #  page.should # fill in
  #  click_link "sample app"
  #  page.should # fill in
  #end

  describe "Help page" do
    before { visit help_path }
    #it "should have the h1 'Help'" do
    #  #visit '/static_pages/help'
    #  #visit help_path
    #  page.should have_selector('h1', :text => 'Help')
    #end
    #it "should have the title 'Help'" do
    #  #visit '/static_pages/help'
    #  #visit help_path
    #  #page.should have_selector('title',
    #  #                  :text => "Ruby on Rails Tutorial Sample App | Help")
    #  expect(page).to have_title("#{base_title} | Help")
    #end
    it { should have_selector('h1', text: 'Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }
    #it "should have the h1 'About Us'" do
    #  #visit '/static_pages/about'
    #  #visit about_path
    #  page.should have_selector('h1', :text => 'About Us')
    #end
    #it "should have the title 'About Us'" do
    #  #visit '/static_pages/about'
    #  #visit about_path
    #  expect(page).to have_title("#{base_title} | About Us")
    #end
    it { should have_selector('h1', text: 'About') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }
    #it "should have the h1 'Contact'" do
    #  #visit '/static_pages/contact'
    #  #visit contact_path
    #  page.should have_selector('h1', text: 'Contact')
    #end
    #it "should have the title 'Contact'" do
    #  #visit '/static_pages/contact'
    #  #visit contact_path
    #  expect(page).to have_title("#{base_title} | Contact")
    #end
    it { should have_selector('h1', text: 'Contact') }
    it { should have_title(full_title('Contact')) }
  end

end