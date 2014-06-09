require 'spec_helper'

describe "PostPages" do
  subject { page }

  let(:admin_user) { FactoryGirl.create(:admin) }
  before { sign_in admin_user }

  describe "post creation" do
  	before { visit new_post_path }

  	describe "with invalid information" do

  	  it "should not create a post" do
  	  	expect { click_button "Create Post" }.not_to change(Post, :count)
  	  end

  	  describe "error messages" do
  	  	before { click_button "Create Post" }
  	  	it { should have_content('error') }
  	  end
  	end

  	describe "with valid information" do
  	  before do
  	  	fill_in 'Title', with: "Lorem ipsum"
  	  	fill_in 'Content', with: "Lorem ipsum"
  	  end

  	  it "should create a micropost" do
  	  	expect { click_button "Create Post" }.to change(Post, :count).by(1)
  	  end
  	end
  end
end
