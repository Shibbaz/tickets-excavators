require "application_system_test_case"

class ExcavatorsTest < ApplicationSystemTestCase
  setup do
    @excavator = excavators(:one)
  end

  test "visiting the index" do
    visit excavators_url
    assert_selector "h1", text: "Excavators"
  end

  test "should create excavator" do
    visit excavators_url
    click_on "New excavator"

    fill_in "Companyname", with: @excavator.companyName
    click_on "Create Excavator"

    assert_text "Excavator was successfully created"
    click_on "Back"
  end

  test "should update Excavator" do
    visit excavator_url(@excavator)
    click_on "Edit this excavator", match: :first

    fill_in "Companyname", with: @excavator.companyName
    click_on "Update Excavator"

    assert_text "Excavator was successfully updated"
    click_on "Back"
  end

  test "should destroy Excavator" do
    visit excavator_url(@excavator)
    click_on "Destroy this excavator", match: :first

    assert_text "Excavator was successfully destroyed"
  end
end
