feature "a User" do
  scenario "can see the other users" do
    sign_up_user_1
    sign_up_user_2
    login_user_1
    first(:css, ".logo").click
    expect(page).to have_content("user2")
  end

  scenario "can invite a friend" do
    sign_up_user_1
    sign_up_user_2
    login_user_1
    first(:css, ".logo").click
    expect(page).to have_button("Invite")
  end

  scenario "can see request for friendship" do
    sign_up_user_1
    sign_up_user_2
    login_user_1
    first(:css, ".logo").click
    click_button "Invite"
    click_link "Logout"
    login_user_2
    first(:css, ".logo").click
    expect(page).to have_button("Accept")
    expect(page).to have_button("Refuse")
  end

  scenario "can be friend with another one" do
    sign_up_user_1
    sign_up_user_2
    login_user_1
    first(:css, ".logo").click
    click_button "Invite"
    click_link "Logout"
    login_user_2
    first(:css, ".logo").click
    click_button "Accept"
    expect(page).not_to have_button("Accept")
    expect(page).not_to have_button("Refuse")
  end
end
