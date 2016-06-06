require "rails_helper"

RSpec.feature "UserSearchesLinks", type: :feature do
  include WaitForAjax

  scenario "user searches for a link", js: true do
    link1 = Link.create(title: "hey", url: "http://wwww.google.com")
    link2 = Link.create(title: "sup", url: "http://wwww.yahoo.com")

    user = User.create(email: "hi@example.com", password: "hello", password_confirmation: "hello")

    visit "/"

    fill_in "Email", with: "hi@example.com"
    fill_in "Password", with: "hello"
    click_button "Login!"

    wait_for_ajax

    expect(page).to have_content(link1.title)
    expect(page).to have_content(link2.title)

    fill_in "filter", with: "google"

    expect(page).to have_content(link1.title)
    expect(page).to have_content(link1.url)

    expect(page).to_not have_content(link2.title)
    expect(page).to_not have_content(link2.url)

    fill_in "filter", with: ""

    expect(page).to have_content(link2.title)

    expect(page).to have_content(link1.title)
  end
end
