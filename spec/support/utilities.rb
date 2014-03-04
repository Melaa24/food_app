include ApplicationHelper

def valid_signup(page)
  fill_in "Name",         with: "Example User"
  fill_in "Email",        with: "user@example.com"
  fill_in "Studio",		    with: "Yoga Now"
  fill_in "Ayurveda",	    with: "Dr. Feel Good"
  fill_in "Password",     with: "foobar"
  fill_in "Confirmation", with: "foobar"
end

def full_title(page_title)
  base_title = "Food App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end