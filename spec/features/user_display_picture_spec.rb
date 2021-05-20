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

  xscenario "a user's display picture appears next to post" do
    visit '/'
    # upload picture in sign up
    #login and create post
    #expect page to have image file using have_css("img[src*='w3schools']")
  end
end 