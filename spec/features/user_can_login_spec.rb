require_relative "../web_helpers.rb"

feature "login" do
  scenario "Successful login" do
    sign_up
    visit "/"
    fill_in "Email", with: "team@derailed.com"
    fill_in "Password", with: "CKMMNTT"
    click_button "Login"
    expect(page).to have_content("Successful login, welcome teamDerailed")
  end

  scenario "login with incorrect password" do
    sign_up
    visit "/"
    fill_in "Email", with: "team@derailed.com"
    fill_in "Password", with: "CTTsaesbgh"
    click_button "Login"
    expect(page).to have_content("Incorrect email or password")
  end

  scenario "login with incorrect email" do
    sign_up
    visit "/"
    fill_in "Email", with: "team@dled.com"
    fill_in "Password", with: "CKMMNTT"
    click_button "Login"
    expect(page).to have_content("Incorrect email or password")
  end
end
