require "test_helper"

class PunishmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @punishment = punishments(:one)
  end

  test "should get index" do
    get punishments_url
    assert_response :success
  end

  test "should get new" do
    get new_punishment_url
    assert_response :success
  end

  test "should create punishment" do
    assert_difference('Punishment.count') do
      post punishments_url, params: { punishment: { kwota: @punishment.kwota } }
    end

    assert_redirected_to punishment_url(Punishment.last)
  end

  test "should show punishment" do
    get punishment_url(@punishment)
    assert_response :success
  end

  test "should get edit" do
    get edit_punishment_url(@punishment)
    assert_response :success
  end

  test "should update punishment" do
    patch punishment_url(@punishment), params: { punishment: { kwota: @punishment.kwota } }
    assert_redirected_to punishment_url(@punishment)
  end

  test "should destroy punishment" do
    assert_difference('Punishment.count', -1) do
      delete punishment_url(@punishment)
    end

    assert_redirected_to punishments_url
  end
end
