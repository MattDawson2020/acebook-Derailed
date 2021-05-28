require_relative "../web_helpers.rb"

feature "Profile" do
  scenario "User can visit their profile page" do
    sign_up
    login

    click_link "Profile"
    
    # expect(page).to have_content "teamDerailed's profile"
    expect(page).to have_css("img[src*='bob_ross_img.png']")
  end

end
