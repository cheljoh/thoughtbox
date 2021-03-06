require "rails_helper"

RSpec.feature "UserLogsInandOut", type: feature do

  scenario "user logs in and out" do
    user = User.create(email: "hi@example.com", password: "hello", password_confirmation: "hello")
    visit "/"

    fill_in "Email", with: "hi@example.com"
    fill_in "Password", with: "hello"
    click_button "Login!"

    expect(page).to have_content("Check out these kewwwll linkkss")

    click_on "Logout"

    expect(page).to have_content("You have successfully logged out!")
    expect(current_path).to eq("/login")
  end
end
