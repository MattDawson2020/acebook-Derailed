require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up
    login
    first(:css, ".logo").click
    fill_in "new_post_message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
  
end

RSpec.feature "Like", type: :feature do
  scenario "Can like a post" do
    sign_up
    login
    first(:css, ".logo").click
    fill_in "new_post_message", with: "Hello, world!"
    click_button "Submit"
    first(:css, ".like-link").click
    expect(page).to have_content("1 like")
  end
end

RSpec.feature "Post_image", type: :feature do
  scenario "Can add a picture to the post" do
    sign_up
    login
    first(:css, ".logo").click
    fill_in "new_post_message", with: "Hello, world!"
    attach_file "Post_picture", (File.dirname(__FILE__) + "/images/Unknown.png")
    click_button "Submit"
    expect(page).to have_css("img[src*='Unknown.png']")
  end
end
