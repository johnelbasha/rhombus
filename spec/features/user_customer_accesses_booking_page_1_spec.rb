require 'rails_helper'

def sign_up
  click_link "Sign up"
  fill_in "user[email]", with: 'johnelbasha@gmail.com'
  fill_in "user[password]", with: '123456'
  fill_in "user[password_confirmation]", with: '123456'
  click_button 'Sign up'
end

RSpec.feature "user's customer accesses page 1 of booking" do

  scenario "customer navigates to unique url" do
    visit "/"
    click_link "Create Event"
    sign_up
    fill_in "Event Title", with: "Painting Exhibition: Da Vinci"
    fill_in "Event Location", with: "28 Russell Road, Salford"
    fill_in "Confirmation Message", with: "Thanks for your booking. Check your email for further details."   
    fill_in "event[creation_button_text]", with: "Back to Website"   
    fill_in "event[creation_button_url]", with: "https://www.oxfordceramics.com/"   
    fill_in "Notification Email", with: "sales@gilfonce.com"   
    click_button "Save"
    @event = Event.last
    code = @event.uid
    url_path = "/" + code
    visit url_path
    expect(page).to have_content("Painting Exhibition: Da Vinci")
  end
end