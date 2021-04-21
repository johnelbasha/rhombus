require 'rails_helper'

RSpec.feature "landing page" do 
  scenario "visitor navigates to home url" do
    visit "/"
    expect(page).to have_content("Rhombus")
    expect(page).to have_link("Create Event")
  end

end