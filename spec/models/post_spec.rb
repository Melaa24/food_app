require 'spec_helper'

describe Post do
  
  let(:admin_user) { FactoryGirl.create(:admin) }
  before { @post = admin_user.posts.build(title: "Lorem ipsum", 
  								content: "Lorem ipsum", user_id: admin_user.id) }

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq admin_user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @post.user_id = nil }
  	it { should_not be_valid }
  end

  describe "when title blank" do
  	before { @post.title = " " }
  	it { should_not be_valid }
  end

  describe "when content is blank" do
  	before { @post.content = " " }
  	it { should_not be_valid }
  end

  describe "when user is not an admin" do
  end
end
