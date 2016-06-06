require "rails_helper"

RSpec.feature "UserUpdatesLinkStatus", type: feature do
  include WaitForAjax

  scenario "user updates link status", js: true do
    user = User.create(email: "hi@example.com", password: "hello", password_confirmation: "hello")

    visit "/"

    fill_in "Email", with: "hi@example.com"
    fill_in "Password", with: "hello"
    click_button "Login!"

    fill_in "Url", with: "http://google.com"
    fill_in "Title", with: "best site ever"
    click_button "Submit"

    click_on "Mark as Read"

    wait_for_ajax

    expect(page).to have_content("Mark as Unread")

    click_on "Mark as Unread"

    wait_for_ajax

    expect(page).to have_content("Mark as Read")
  end
end
