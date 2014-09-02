feature "Adding a student" do
  scenario "Happy Path" do
    visit '/'
    fill_in "Name", with: "Sally"
    click_on "Add a Student"
    page.should have_content("Sally has been added to the list.")
    current_path.should == students_path
    within("ul#students") do
      page.should have_content("Sally")
    end
  end

  scenario "Empty Input" do
    visit '/'
    click_on "Add a Student"
    page.should have_content("Student could not be added.")
    page.should have_error("can't be blank", on: "Name")
  end
end
