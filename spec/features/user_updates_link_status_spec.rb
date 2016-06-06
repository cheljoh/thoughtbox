require "rails_helper"

RSpec.feature "UserUpdatesLinkStatus", type: feature do

  scenario "user updates link status" do
    user = User.create(email: "hi@example.com", password: "hello", password_confirmation: "hello")

    visit "/"

    fill_in "Email", with: "hi@example.com"
    fill_in "Password", with: "hello"
    click_button "Login!"

    fill_in "Url", with: "http://google.com"
    fill_in "Title", with: "best site ever"
    click_button "Submit"

    click_button "Mark as Read"
    expect(page).to have_content("Link is Read!")

    click_button "Mark as Unread"
    expect(page).to have_content("Link is Unread!")
  end
end
