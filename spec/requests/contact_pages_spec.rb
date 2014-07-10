require 'spec_helper'

describe "ContactPages" do
  
  subject { page }

  describe "create a new contact form" do
    before { visit new_contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }

    describe "contact form" do
      before do
        fill_in 'contact_name',     with: "Full Name"
        fill_in 'contact_email',    with: "example@example.com"
        fill_in 'contact_phone',    with: "555-1234"
        fill_in 'contact_message',  with: "questions and comments"
      end

     before { click_button "Send Message" }
     it { should have_content('Thank You') }
    end
  end
end
