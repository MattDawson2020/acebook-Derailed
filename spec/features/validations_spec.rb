require "rails_helper"

RSpec.feature "Validations", type: :feature do
  scenario "User can't sign up an existing email" do
    visit "/"
    click_link "Sign up"
    fill_in "Name", with: "User"
    fill_in "Email", with: "user@gmail.com"
    fill_in "Password", with: "123456"
    click_button "Create User"

    # click_button 'Sign Out'
    # this test will break when sign in and sign out is implemented, match the above button to the sign out function created to fix
    visit "/"
    click_link "Sign up"
    fill_in "Name", with: "User"
    fill_in "Email", with: "user@gmail.com"
    fill_in "Password", with: "123456"
    click_button "Create User"
    expect(page).to have_content("You cannot create an account")
    # attempted to match to flash notice warning user could not be created but had difficulty implementing logic, update test
  end

  scenario "User can't sign up with missing name" do
    before_user = User.all.length

    visit "/"
    click_link "Sign up"
    fill_in "Name", with: ""
    fill_in "Email", with: "user@gmail.com"
    fill_in "Password", with: "123456"
    click_button "Create User"

    after_user = User.all.length

    expect(before_user).to eq(after_user)
  end

  scenario "User can't sign up with missing email" do
    before_user = User.all.length

    visit "/"
    click_link "Sign up"
    fill_in "Name", with: "user"
    fill_in "Email", with: ""
    fill_in "Password", with: "123456"
    click_button "Create User"

    after_user = User.all.length

    expect(before_user).to eq(after_user)
  end

  scenario "User can't sign up with missing password" do
    before_user = User.all.length

    visit "/"
    click_link "Sign up"
    fill_in "Name", with: "user"
    fill_in "Email", with: "user@gmail.com"
    fill_in "Password", with: ""
    click_button "Create User"

    after_user = User.all.length

    expect(before_user).to eq(after_user)
  end

  scenario "User can't sign up with invalid password" do
    before_user = User.all.length

    visit "/"
    click_link "Sign up"
    fill_in "Name", with: "user"
    fill_in "Email", with: "user@gmail.com"
    fill_in "Password", with: "123"
    click_button "Create User"

    after_user = User.all.length

    expect(before_user).to eq(after_user)
  end

  scenario "User can't sign up with invalid email" do
    before_user = User.all.length

    visit "/"
    click_link "Sign up"
    fill_in "Name", with: "user"
    fill_in "Email", with: "user"
    fill_in "Password", with: "123456"
    click_button "Create User"

    after_user = User.all.length

    expect(before_user).to eq(after_user)
  end
end
