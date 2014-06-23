require 'spec_helper'

describe "ContactPages" do
  
  subject { page }

  describe "create a new contact form" do
    before { visit new_contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }

    describe "contact form" do
      before do
        fill_in 'Name',     with: "Full Name"
        fill_in 'Email',    with: "example@example.com"
        fill_in 'Phone',    with: "555-1234"
        select 'Schedule a workshop', from: "topic"
        fill_in 'Message',  with: "questions and comments"
      end

     before { click_button "Send Message" }
     it { should have_content('Thank You') }
    end
  end
end
