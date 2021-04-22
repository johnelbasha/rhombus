require 'rails_helper'

RSpec.feature 'creating new event as a visitor' do
  scenario 'a visitor (not registered ) tries to create a new event' do
    visit "/"
    click_link "Create Event"
    expect(page).to have_content("You need to sign in or sign up before continuing.")
    click_link "Sign up"
    fill_in "user[email]", with: 'johnelbasha@gmail.com'
    fill_in "user[password]", with: '123456'
    fill_in "user[password_confirmation]", with: '123456'
    click_button 'Sign up'
    expect(page).to have_content("New Event")
    expect(page).to have_content("Please fill in the form below")
    expect(page).to have_content("Event Title")
    expect(page).to have_content("The name of your event")
    fill_in "Event Title", with: "Painting Exhibition: Da Vinci"
    expect(page).to have_content("Event Location")
    expect(page).to have_content("Where is the event taking place?")
    fill_in "Event Location", with: "28 Russell Road, Salford"
    expect(page).to have_content("Confirmation Message") 
    expect(page).to have_content("Text displayed once booking has been confirmed")
    fill_in "Confirmation Message", with: "Thanks for your booking. Check your email for further details."   
    expect(page).to have_content("Confirmation Button")
    expect(page).to have_content("If you would like a button to redirect users after booking")
    fill_in "event[creation_button_text]", with: "Back to Website"   
    fill_in "event[creation_button_url]", with: "https://www.oxfordceramics.com/"   
    expect(page).to have_content("Notification Email")
    expect(page).to have_content("Where booking notifications will be sent")
    fill_in "Notification Email", with: "sales@gilfonce.com"   
    click_button "Save"
    expect(page.current_path). to eq(root_path)
    expect(page).to have_content("Painting Exhibition: Da Vinci")
    expect(page).to have_content("Event created")
    # this is all the code needed to create a new event: e.g. event # 710c8f
    # the next stage is set to edit the availability for the event.
  end

  scenario 'a user forgets a required field' do
    visit "/"
    click_link "Create Event"
    click_link "Sign up"
    fill_in "user[email]", with: 'johnelbasha@gmail.com'
    fill_in "user[password]", with: '123456'
    fill_in "user[password_confirmation]", with: '123456'
    click_button 'Sign up'
    fill_in "Event Title", with: "Painting Exhibition: Da Vinci"
    click_button "Save"
    expect(page).to have_content("Event has not been created!")
    expect(page).to have_content("Location can't be blank")
  end
  
end