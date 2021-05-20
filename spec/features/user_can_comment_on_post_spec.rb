require_relative "../web_helpers.rb"

feature "comments" do
  scenario "User can create a comment" do
    sign_up
    login

    click_link "New post"
    #change to button when styling is introduced

    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    
    click_link "New comment"
    fill_in "Body", with: "Hello, thing!"
    click_button "Submit"

    expect(page).to have_content "Hello, world!"
    expect(page).to have_content "Hello, thing!"
  end

end
