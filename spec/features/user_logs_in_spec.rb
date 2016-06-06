require "rails_helper"

RSpec.feature "UserLogsIn", type: feature do

  scenario "user logs in" do
    visit "/users/new"

    fill_in "Email", with: "chelsea@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(page).to have_content("Check out these kewwwll linkkss")
  end

  scenario "user must have unique email" do
    visit "/users/new"

    fill_in "Email", with: "chelsea@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(page).to have_content("Check out these kewwwll linkkss")

    visit "/users/new"

    fill_in "Email", with: "chelsea@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(page).to have_content("Please enter a valid username and password")
  end
end
