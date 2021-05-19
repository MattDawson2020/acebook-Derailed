require_relative "../web_helpers.rb"
require "./app/helpers/sessions_helper.rb"

feature "Logout" do
  scenario "user can logout" do
    sign_up
    visit "/"
    fill_in "Email", with: "team@derailed.com"
    fill_in "Password", with: "CKMMNTT"
    click_button "Login"
    expect(page).to have_content("Successful login, welcome teamDerailed")
    click_link "Logout"
    expect(current_path).to eq "/"
    expect(@current_user).to be nil
  end
end
