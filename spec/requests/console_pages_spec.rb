require 'spec_helper'

describe "ConsolePages" do

  subject { page }

  describe "when not an admin" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit console_path(:user)
    end

    it { should_not have_link('Admin Console') }
  end

  
  describe "when loged in as an admin" do
    let(:admin_user) { FactoryGirl.create(:admin) }
    before do
      sign_in admin_user
      visit console_path(admin_user)
    end

    it { should have_title('Admin Console') }
    it { should have_link('Create a Post') }
    it { should have_link('Display Users') }
    it { should have_link('Edit Menu Items') }
    it { should have_link('Order History') }
    it { should have_link('This Weeks Orders') }
  end
end
