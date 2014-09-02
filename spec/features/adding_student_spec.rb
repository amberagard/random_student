feature "Adding a student" do
  scenario "Happy Path" do
    visit '/'
    click_on "Add a Student"
    save_and_open_page
    fill_in "Name", with: "Sally"
    click_on "Add Student"
    page.should have_content("Sally was added to the list.")
    current_path.should == '/'
    within("ul#students") do
      page.should have_content("Sally")
    end
  end

  scenario "Empty Input" do
    visit '/'
    click_on "Add a Student"

    click_on "Add Student"
    page.should have_content("Student name cannot be blank.")
  end
end
