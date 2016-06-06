require "rails_helper"

RSpec.feature "UserLogsOut", type: feature do

  scenario "user logs out" do
    visit "/"

    click_on "Log out"

    expect(page).to have_content("You have successfully logged out!")
  end
end
