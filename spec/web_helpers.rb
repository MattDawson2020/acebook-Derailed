def sign_up
  visit "/"
  click_link "Sign up"
  fill_in "Name", with: "teamDerailed"
  fill_in "Email", with: "team@derailed.com"
  attach_file 'Display Picture', (File.dirname(__FILE__) + '/features/images/bob_ross_img.png')
  fill_in "Password", with: "CKMMNTT"
  fill_in "Password confirmation", with: "CKMMNTT"
  click_button "Create User"
end

def login
  visit "/"
  fill_in "floatingInput", with: "team@derailed.com"
  fill_in "floatingPassword", with: "CKMMNTT"
  click_button "Login"
end
