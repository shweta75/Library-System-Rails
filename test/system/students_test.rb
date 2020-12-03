require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "creating a Student" do
    visit students_url
    click_on "New Student"

    fill_in "Address", with: @student.address
    fill_in "Email", with: @student.email
    fill_in "Fathers name", with: @student.fathers_name
    fill_in "First name", with: @student.first_name
    fill_in "Gender", with: @student.gender
    fill_in "Last name", with: @student.last_name
    fill_in "Mothers name", with: @student.mothers_name
    fill_in "Year of birth", with: @student.year_of_birth
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "updating a Student" do
    visit students_url
    click_on "Edit", match: :first

    fill_in "Address", with: @student.address
    fill_in "Email", with: @student.email
    fill_in "Fathers name", with: @student.fathers_name
    fill_in "First name", with: @student.first_name
    fill_in "Gender", with: @student.gender
    fill_in "Last name", with: @student.last_name
    fill_in "Mothers name", with: @student.mothers_name
    fill_in "Year of birth", with: @student.year_of_birth
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "destroying a Student" do
    visit students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student was successfully destroyed"
  end
end
