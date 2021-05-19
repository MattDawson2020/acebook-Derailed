require "rails_helper"

RSpec.feature "Signup", type: :feature do
  scenario "User can sign up and redirected to posts" do
    visit "/"
    click_link "Sign up"
    fill_in "Name", with: "User"
    fill_in "Email", with: "user@gmail.com"
    fill_in "Password", with: "123456"
    click_button "Create User"
    expect(page).to have_content("You have created your account User")
    expect(current_path).to eq("/")
  end
end
