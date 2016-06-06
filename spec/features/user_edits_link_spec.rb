require "rails_helper"

RSpec.feature "UserEditsLink", type: feature do

  scenario "user edits link" do
    user = User.create(email: "hi@example.com", password: "hello", password_confirmation: "hello")

    visit "/"

    fill_in "Email", with: "hi@example.com"
    fill_in "Password", with: "hello"
    click_button "Login!"

    fill_in "Url", with: "http://google.com"
    fill_in "Title", with: "best site ever"
    click_button "Submit"

    link = Link.last

    click_on "Edit Link!"

    fill_in "Url", with: "http://yahoo.com"
    fill_in "Title", with: "i luv yahoo"
    click_button "Edit"

    expect(page).to have_content("i luv yahoo")
  end

  scenario "user edits link-invalid URL" do
    user = User.create(email: "hi@example.com", password: "hello", password_confirmation: "hello")

    visit "/"

    fill_in "Email", with: "hi@example.com"
    fill_in "Password", with: "hello"
    click_button "Login!"

    fill_in "Url", with: "http://google.com"
    fill_in "Title", with: "best site ever"
    click_button "Submit"

    link = Link.last

    click_on "Edit Link!"

    fill_in "Url", with: "hahahahaah"
    fill_in "Title", with: "i luv yahoo"
    click_button "Edit"

    expect(page).to have_content("Your link is not valid, please try again")
  end

  # scenario "user submits invalid link" do
  #   user = User.create(email: "hi@example.com", password: "hello", password_confirmation: "hello")
  #
  #   visit "/"
  #
  #   fill_in "Email", with: "hi@example.com"
  #   fill_in "Password", with: "hello"
  #   click_button "Login!"
  #
  #   fill_in "Url", with: "hahahaha"
  #   fill_in "Title", with: "best site ever"
  #   click_button "Submit"
  #
  #   expect(page).to have_content("Your link is not valid, please try again")
  # end
end
