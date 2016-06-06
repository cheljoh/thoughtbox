require "rails_helper"

RSpec.feature "UserLogsIn", type: feature do

  scenario "user logs in" do
    visit "/users/new"

    fill_in "Email", with: "chelsea@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"
  end
end
