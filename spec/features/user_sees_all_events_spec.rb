require 'rails_helper'

RSpec.feature "listing all events" do

  before do
  @user = User.create(email: "sample@harris.com", password: "123456")
  @event1 = Event.create(title: "House Party", location: "Berlin", user: @user)
  @event1.generate_uid
  @event1.save

  @event2 = Event.create(title: "Birthday", location: "Rome", user: @user)
  @event2.generate_uid
  @event2.save

  @event3 = Event.create(title: "Graduation", location: "Paris", user: @user)
  @event3.generate_uid
  @event3.save

  @event4 = Event.create(title: "Retirement", location: "London", user: @user)
  @event4.generate_uid
  @event4.save

  end

  scenario "user sees 4 existing events" do
    visit "/"
    expect(page).to have_content(@event1.title)
    expect(page).to have_content(@event1.location)
    expect(page).to have_link(@event1.uid)
    expect(page).to have_content(@event2.title)
    expect(page).to have_content(@event2.location)
    expect(page).to have_link(@event2.uid)
    expect(page).to have_content(@event3.title)
    expect(page).to have_content(@event3.location)
    expect(page).to have_link(@event3.uid)
    expect(page).to have_content(@event4.title)
    expect(page).to have_content(@event4.location)
    expect(page).to have_link(@event4.uid)
  end
end