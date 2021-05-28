require_relative "../web_helpers.rb"

feature "comments" do
  scenario "User can create a comment" do
    sign_up
    login
    first(:css, ".logo").click
    fill_in "new_post_message", with: "Hello, world!"
    click_button "Submit"
    first(:css, ".comment-link").click
    fill_in "box-comment", with: "Hello, thing!"
    click_button "Submit"
    first(:css, ".del-com").click
    expect(page).not_to have_content "Hello, thing!"
  end
end
