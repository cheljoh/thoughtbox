require "rails_helper"

RSpec.feature "UserSubmitsLink", type: feature do

  scenario "user submits link" do
    user = User.create(email: "hi@example.com", password: "hello", password_confirmation: "hello")

    visit "/"

    fill_in "Email", with: "hi@example.com"
    fill_in "Password", with: "hello"
    click_button "Login!"

    fill_in "Url", with: "http://google.com"
    fill_in "Title", with: "best site ever"
    click_button "Submit"

    expect(page).to have_content("http://google.com")
    expect(page).to have_content("best site ever")
  end

  scenario "user submits invalid link" do
    user = User.create(email: "hi@example.com", password: "hello", password_confirmation: "hello")

    visit "/"

    fill_in "Email", with: "hi@example.com"
    fill_in "Password", with: "hello"
    click_button "Login!"

    fill_in "Url", with: "hahahaha"
    fill_in "Title", with: "best site ever"
    click_button "Submit"

    expect(page).to have_content("Your link is not valid, please try again")
  end
end
