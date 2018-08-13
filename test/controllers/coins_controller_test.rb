require 'test_helper'

class CoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coin = create(:coin)
  end

  test "should get index" do
    get coins_url, as: :json
    assert_response :success
  end

  test "should create coin" do
    assert_difference('Coin.count') do
      post coins_url, params: { coin: { root_uuid: @coin.root_uuid } }, as: :json
    end

    assert_response 201
  end

  test "should show coin" do
    get coin_url(@coin), as: :json
    assert_response :success
  end

  test "should check coin" do
    post check_coins_url(@coin), params: { coin: { md5: @coin.md5, root_uuid: @coin.root_uuid, spent: @coin.spent, uuid: @coin.uuid } }, as: :json
    assert_response 200
  end

end
