require_relative "../web_helpers.rb"

feature "User displays picture" do
  scenario "a user's name appears next to a post" do
    sign_up
    login
    # save_and_open_page
    click_link("New post")
    fill_in("Message", with: "Hello")
    click_button("Submit")
    expect(page).to have_content("0")
  end

  scenario "a user's display picture appears next to post" do
    visit "/"
    click_link "Sign up"
    fill_in "signUpName", with: "teamDerailed"
    fill_in "signUpEmail", with: "team@derailed.com"
    attach_file "Display Picture", (File.dirname(__FILE__) + "/images/bob_ross_img.png")
    fill_in "signUpPassword", with: "CKMMNTT"
    fill_in "signUpPasswordConfirm", with: "CKMMNTT"
    click_button 'Create User'
    login
    click_link("New post")
    fill_in("Message", with: "Hello")
    click_button("Submit")
    expect(page).to have_css("img[src*='bob_ross_img.png']")
  end
end
