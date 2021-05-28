require 'rails_helper'

RSpec.feature "Edit profile", type: :feature do
  scenario "Can change nickname" do
    sign_up
    login
    click_link "Profile"
    click_link "Edit Profile"
    fill_in "Nickname", with: "Nick"
    click_button "Confirm Changes"
    expect(page).to have_content("Nick")
  end
  
end

RSpec.feature "Edit profile", type: :feature do
  scenario "Can change name" do
    sign_up
    login
    click_link "Profile"
    click_link "Edit Profile"
    fill_in "Name", with: "Jordan"
    click_button "Confirm Changes"
    expect(page).to have_content("Jordan")
  end
  
end

RSpec.feature "Edit profile", type: :feature do
  scenario "Can change email" do
    sign_up
    login
    click_link "Profile"
    click_link "Edit Profile"
    fill_in "Email Address", with: "another@email.com"
    click_button "Confirm Changes"
    expect(page).to have_content("another@email.com")
    save_and_open_page
  end
  
end