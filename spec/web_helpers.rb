def sign_up
  visit "/"
  click_link "Sign up"
  fill_in "signUpName", with: "teamDerailed"
  fill_in "signUpEmail", with: "team@derailed.com"
  attach_file 'signUpDisplayPic', (File.dirname(__FILE__) + '/features/images/bob_ross_img.png')
  fill_in "signUpPassword", with: "CKMMNTT"
  fill_in "signUpPasswordConfirm", with: "CKMMNTT"
  click_button "Create User"
end

def login
  fill_in "floatingInput", with: "team@derailed.com"
  fill_in "floatingPassword", with: "CKMMNTT"
  click_button "Login"
end
