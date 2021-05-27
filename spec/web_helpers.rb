def sign_up
  visit "/"
  click_link "Sign up"
  fill_in "signUpName", with: "teamDerailed"
  fill_in "signUpEmail", with: "team@derailed.com"
  attach_file "signUpDisplayPic", (File.dirname(__FILE__) + "/features/images/bob_ross_img.png")
  fill_in "signUpPassword", with: "CKMMNTT"
  fill_in "signUpPasswordConfirm", with: "CKMMNTT"
  click_button "Create User"
end

def login
  fill_in "floatingInput", with: "team@derailed.com"
  fill_in "floatingPassword", with: "CKMMNTT"
  click_button "Login"
end

def sign_up_user_1
  visit "/"
  click_link "Sign up"
  fill_in "signUpName", with: "user1"
  fill_in "signUpEmail", with: "user@1.com"
  attach_file "signUpDisplayPic", (File.dirname(__FILE__) + "/features/images/bob_ross_img.png")
  fill_in "signUpPassword", with: "CKMMNTT"
  fill_in "signUpPasswordConfirm", with: "CKMMNTT"
  click_button "Create User"
end

def login_user_1
  fill_in "floatingInput", with: "user@1.com"
  fill_in "floatingPassword", with: "CKMMNTT"
  click_button "Login"
end

def sign_up_user_2
  visit "/"
  click_link "Sign up"
  fill_in "signUpName", with: "user2"
  fill_in "signUpEmail", with: "user@2.com"
  attach_file "signUpDisplayPic", (File.dirname(__FILE__) + "/features/images/bob_ross_img.png")
  fill_in "signUpPassword", with: "CKMMNTT"
  fill_in "signUpPasswordConfirm", with: "CKMMNTT"
  click_button "Create User"
end

def login_user_2
  fill_in "floatingInput", with: "user@2.com"
  fill_in "floatingPassword", with: "CKMMNTT"
  click_button "Login"
end
