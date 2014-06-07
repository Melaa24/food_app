require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    let(:admin_user) { FactoryGirl.create(:admin) }
    let!(:p1) { FactoryGirl.create(:post, user: admin_user, title: "Foo", content: "Foo") }
    let!(:p2) { FactoryGirl.create(:post, user: admin_user, title: "Bar", content: "Bar") }
    before { visit root_path }

    it { should have_content('My name is Deborah ') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }

    describe "blog posts" do
      it { should have_content(p1.title) }
      it { should have_content(p1.content) }
      it { should have_content(p2.title) }
      it { should have_content(p2.content) }
    end
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('Mission Statement') }
    it { should have_title(full_title('About')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end
end