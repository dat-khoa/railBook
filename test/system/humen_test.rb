require "application_system_test_case"

class HumenTest < ApplicationSystemTestCase
  setup do
    @human = humen(:one)
  end

  test "visiting the index" do
    visit humen_url
    assert_selector "h1", text: "Humen"
  end

  test "creating a Human" do
    visit humen_url
    click_on "New Human"

    fill_in "Body", with: @human.body
    fill_in "Head", with: @human.head
    click_on "Create Human"

    assert_text "Human was successfully created"
    click_on "Back"
  end

  test "updating a Human" do
    visit humen_url
    click_on "Edit", match: :first

    fill_in "Body", with: @human.body
    fill_in "Head", with: @human.head
    click_on "Update Human"

    assert_text "Human was successfully updated"
    click_on "Back"
  end

  test "destroying a Human" do
    visit humen_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Human was successfully destroyed"
  end
end
