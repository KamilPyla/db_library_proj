require "application_system_test_case"

class PunishmentsTest < ApplicationSystemTestCase
  setup do
    @punishment = punishments(:one)
  end

  test "visiting the index" do
    visit punishments_url
    assert_selector "h1", text: "Punishments"
  end

  test "creating a Punishment" do
    visit punishments_url
    click_on "New Punishment"

    fill_in "Kwota", with: @punishment.kwota
    click_on "Create Punishment"

    assert_text "Punishment was successfully created"
    click_on "Back"
  end

  test "updating a Punishment" do
    visit punishments_url
    click_on "Edit", match: :first

    fill_in "Kwota", with: @punishment.kwota
    click_on "Update Punishment"

    assert_text "Punishment was successfully updated"
    click_on "Back"
  end

  test "destroying a Punishment" do
    visit punishments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Punishment was successfully destroyed"
  end
end
