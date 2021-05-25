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

RSpec.feature "Post_image", type: :feature do
  scenario "Can add a picture to the post" do
    sign_up
    login
    # save_and_open_page
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    attach_file "Post_picture", (File.dirname(__FILE__) + "/images/Unknown.png")
    click_button "Submit"
    expect(page).to have_css("img[src*='Unknown.png']")
  end
end
