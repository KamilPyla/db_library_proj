require "application_system_test_case"

class ReadersTest < ApplicationSystemTestCase
  setup do
    @reader = readers(:one)
  end

  test "visiting the index" do
    visit readers_url
    assert_selector "h1", text: "Readers"
  end

  test "creating a Reader" do
    visit readers_url
    click_on "New Reader"

    fill_in "Data urodzenia", with: @reader.data_urodzenia
    fill_in "Email", with: @reader.email
    fill_in "Haslo", with: @reader.haslo
    fill_in "Imie", with: @reader.imie
    fill_in "Nazwisko", with: @reader.nazwisko
    fill_in "Telefon", with: @reader.telefon
    click_on "Create Reader"

    assert_text "Reader was successfully created"
    click_on "Back"
  end

  test "updating a Reader" do
    visit readers_url
    click_on "Edit", match: :first

    fill_in "Data urodzenia", with: @reader.data_urodzenia
    fill_in "Email", with: @reader.email
    fill_in "Haslo", with: @reader.haslo
    fill_in "Imie", with: @reader.imie
    fill_in "Nazwisko", with: @reader.nazwisko
    fill_in "Telefon", with: @reader.telefon
    click_on "Update Reader"

    assert_text "Reader was successfully updated"
    click_on "Back"
  end

  test "destroying a Reader" do
    visit readers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reader was successfully destroyed"
  end
end
