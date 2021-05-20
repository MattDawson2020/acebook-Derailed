require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up
    login
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    
    expect(page).to have_content("Hello, world!")
  end
end

RSpec.feature "Like", type: :feature do
  scenario "Can like a post" do
    sign_up
    login
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_button "Like"
    expect(page).to have_content("1 Like")
  end
end
