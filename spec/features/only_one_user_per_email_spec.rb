require 'rails_helper'

RSpec.feature "Signing up repeat email", type: :feature do
  
  scenario "User can't sign up an existing email" do
    visit "/"
    click_link "Sign up"
    fill_in "Name", with: "User"
    fill_in "Email", with: "user@gmail.com"
    fill_in "Password", with: "123456"
    click_button "Create User"
    
    # click_button 'Sign Out'
    # this test will break when sign in and sign out is implemented, match the above button to the sign out function created to fix
    visit '/'
    click_link "Sign up"
    fill_in "Name", with: "User"
    fill_in "Email", with: "user@gmail.com"
    fill_in "Password", with: "123456"
    click_button "Create User"

    expect(page).to have_content("Sorry that email is already taken!")
  end

end