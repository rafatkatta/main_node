require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client= create(:client)
    @order = create(:order,client: @client)
  end

  test "should get index" do
    get orders_url, as: :json
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { amount_edin: @order.amount_edin, client_id: @order.client_id, price_euro: @order.price_euro, total_euro: @order.total_euro } }, as: :json
    end

    assert_response 201
  end

  test "should show order" do
    get order_url(@order), as: :json
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { amount_edin: @order.amount_edin, client_id: @order.client_id, price_euro: @order.price_euro, total_euro: @order.total_euro } }, as: :json
    assert_response 200
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order), as: :json
    end

    assert_response 204
  end
end
