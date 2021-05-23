require_relative "../web_helpers.rb"

feature "User has nickname" do
  scenario "nickname can be displayed instead of name" do
    sign_up
    login
    visit "/profile"
    click_button "Edit Profile"
    fill_in "add_nickname", with: "Dog"
    click_button "Submit"
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Dog")
    expect(page).not_to have_content("teamDerailed")
  end
end
