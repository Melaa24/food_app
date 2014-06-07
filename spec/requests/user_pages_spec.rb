require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "index" do
    before do
      sign_in FactoryGirl.create(:admin)
      FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
      FactoryGirl.create(:user, name: "Ben", email: "ben@example.com")
      visit users_path
    end

    it { should have_title('All Users') }
    it { should have_content('All Users') }

    it "should list each user" do
      User.all.each do |user|
        expect(page).to have_selector('li', text: user.name)
      end
    end
  end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit user_path(user)
    end

    it { should have_content(user.name) }
    it { should have_title(user.name) }
    it { should have_content(user.aliment) }
    it { should have_content(user.allergy) }
    it { should have_content(user.birthday) }
    it { should have_content(user.location) }
    it { should have_content(user.phone) }
  end

  describe "signup page" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_title('Sign up') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      FactoryGirl.create(:studio) 
      FactoryGirl.create(:ayurveda)
      before do
        fill_in "Name",               with: "Example User"
        fill_in "Email",              with: "user@example.com"
        select "Example Studio",      from: "user[studio_id]"
        select "Example Ayurveda",    from: "user[ayurveda_id]"
        fill_in "Password",           with: "foobar"
        fill_in "Confirmation",       with: "foobar"
      end
      after(:all) { Studio.delete_all }
      after(:all) { Ayurveda.delete_all }

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit user") }
      it { should have_content('Aliments') }
      it { should have_content('Allergies') }
      it { should have_content('Birthday') }
      it { should have_content('Location') }
      it { should have_content('Phone') }
    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",                  with: new_name
        fill_in "Email",                 with: new_email
        fill_in "Password",              with: user.password
        fill_in "Confirmation",          with: user.password
        click_button "Save changes"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end

  describe "when viewing the admin console home" do
    let(:admin) { FactoryGirl.create(:admin) }
    before do
      sign_in admin
      visit user_path(admin)
    end

    it { should have_content(admin.name) }
    it { should have_button('Create Post') }
    it { should have_link('Display Users') }
    it { should have_link('Edit Menu Items') }
    it { should have_link('Order History') }
    it { should have_link('This Weeks Orders') }
  end
end