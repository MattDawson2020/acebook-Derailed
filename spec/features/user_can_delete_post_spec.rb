require_relative "../web_helpers.rb"

feature "User can delete a post" do
  scenario "delete post" do
    sign_up
    login
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "delete"
    expect(page).not_to have_content "Hello, world!"
  end
end
