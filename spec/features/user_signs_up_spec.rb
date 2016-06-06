require "rails_helper"

RSpec.feature "UserSignsUp", type: feature do

  scenario "user signs up" do
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

  scenario "password and password confirmation must match" do
    visit "/users/new"

    fill_in "Email", with: "chelsea@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "hello"
    click_button "Create Account"

    expect(page).to have_content("Please enter a valid username and password")

    visit "/users/new"

    fill_in "Email", with: "chelsea@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(page).to have_content("Check out these kewwwll linkkss")
  end
end
