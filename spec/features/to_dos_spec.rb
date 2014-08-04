feature "ToDos" do
  scenario "A user can sign in a create a ToDo then edit it" do

    visit "/"
    click_link "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Sign In"

    expect(page).to have_content "Welcome, hunta"

    fill_in "What do you need to do?", with: "Get a haircut"
    click_button "Add ToDo"

    expect(page).to have_content "ToDo added"

    within ".todos" do
      expect(page).to have_content "Get a haircut"
    end
  end

  scenario "A user can edit a ToDo" do
    visit "/"
    click_link "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Sign In"

    expect(page).to have_content "Welcome, hunta"

    fill_in "What do you need to do?", with: "Get a haircut"
    click_button "Add ToDo"

    expect(page).to have_content "ToDo added"

    within ".todos" do
      expect(page).to have_content "Get a haircut"
    end

    click_link "Edit this ToDo"
    expect(page).to have_content "Edit this ToDo"
    fill_in "new_todo", with:"Become an awesome developer"
    click_button "Edit"
    expect(page).to have_content "Become an awesome developer"
  end
end
