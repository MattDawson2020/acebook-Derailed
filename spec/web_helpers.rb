def sign_up
  visit "/"
  click_link "Sign up"
  fill_in "Name", with: "teamDerailed"
  fill_in "Email", with: "team@derailed.com"
  fill_in "Password", with: "CKMMNTT"
  click_button "Create User"
end

def login
  visit "/"
  fill_in "Email", with: "team@derailed.com"
  fill_in "Password", with: "CKMMNTT"
  click_button "Login"
end
