require_relative "../web_helpers.rb"

feature 'User displays picture' do
  scenario "a user's name appears next to a post" do
    sign_up
    login
    click_link("New post")
    fill_in("Message", with: "Hello")
    click_button("Submit")
    expect(page).to have_content("teamDerailed")
  end
end 