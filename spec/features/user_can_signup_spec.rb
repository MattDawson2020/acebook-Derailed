require "rails_helper"

RSpec.feature "Signup", type: :feature do
  scenario "User can sign up and redirected to posts" do
    visit "/"
    click_link "Sign up"
    fill_in "signUpName", with: "User"
    fill_in "signUpEmail", with: "user@gmail.com"
    fill_in "signUpPassword", with: "123456"
    fill_in "signUpPasswordConfirm", with: "123456"
    click_button "Create User"
    expect(page).to have_content("You have created your account User")
    expect(current_path).to eq("/")
  end
end
