require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = create(:client)
  end

  test "should get index" do
    get clients_url, as: :json
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post clients_url, params: { client: { domain: @client.domain, email: @client.email, ipv4: @client.ipv4, ipv6: @client.ipv6, secret_key: @client.secret_key } }, as: :json
    end

    assert_response 201
  end

  test "should show client" do
    get client_url(@client), as: :json
    assert_response :success
  end

  test "should update client" do
    patch client_url(@client), params: { client: { domain: @client.domain, email: @client.email, ipv4: @client.ipv4, ipv6: @client.ipv6, secret_key: @client.secret_key, uuid: @client.uuid } }, as: :json
    assert_response 200
  end

  test "should destroy none active client" do
    @client.update_attribute(:active, false)
    assert_difference('Client.count', -1) do
      delete client_url(@client), as: :json
    end
    assert_response 204
  end

  test "should not destroy active client" do
    assert_difference('Client.count', 0) do
      delete client_url(@client), as: :json
    end
    assert_response 204
  end

end
