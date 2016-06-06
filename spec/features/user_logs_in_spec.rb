require "rails_helper"

RSpec.feature "UserLogsIn", type: feature do

  scenario "user logs in" do
    visit "/users/new"

    fill_in "Username", with: “rachel”
    fill_in "Password", with: “password”
    click_button "Create Account"
  end
end
