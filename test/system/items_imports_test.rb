require "application_system_test_case"

class ItemsImportsTest < ApplicationSystemTestCase
  setup do
    @items_import = items_imports(:one)
  end

  test "visiting the index" do
    visit items_imports_url
    assert_selector "h1", text: "Items Imports"
  end

  test "creating a Items import" do
    visit items_imports_url
    click_on "New Items Import"

    click_on "Create Items import"

    assert_text "Items import was successfully created"
    click_on "Back"
  end

  test "updating a Items import" do
    visit items_imports_url
    click_on "Edit", match: :first

    click_on "Update Items import"

    assert_text "Items import was successfully updated"
    click_on "Back"
  end

  test "destroying a Items import" do
    visit items_imports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Items import was successfully destroyed"
  end
end
