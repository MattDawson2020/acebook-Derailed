require_relative "../web_helpers.rb"

feature "User can delete a post" do
  scenario "delete post" do
    sign_up
    login
    fill_in "new_post_message", with: "Hello, world!"
    click_button "Submit"
    first(:css, ".del-link").click
    expect(page).not_to have_content "Hello, world!"
  end
end
