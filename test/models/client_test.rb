require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  def setup
    @client =create(:client)
  end

  def test_client_ve_uuid_and_secret_key
    assert_not_nil @client.uuid
    assert_not_nil @client.secret_key
  end
 
  def test_ipv4_validation
    @client.ipv4 = '192.168.2.1'
    assert @client.save
  end
  
  def test_ipv6_validation
    client = create(:client,ipv6: '2001:16b8:2e61:4800:9e62:a3b0:3539:6fb0')
    ipv6 = IPAddr.new client.ipv6
    assert ipv6.ipv6?
    assert client.valid?
  end 
  
  def test_connection_info_for_only_domain
    assert_equal @client.connection_info, @client.domain
  end 

  def test_connection_info_for_domain_and_ipv4
    @client.ipv4 = '129.45.35.56'
    @client.save!
    assert_equal @client.connection_info, @client.domain
  end

 def test_connection_info_for_domain_and_ipv4
    @client.ipv4 = '129.45.35.56'
    @client.save!
    assert_equal @client.connection_info, @client.domain
  end
 
 def test_active_client_cannot_be_destroyed
   assert @client.active?
   assert !@client.destroy
 end

 def test_destroy_not_active_client
   @client.active = false
   @client.save!
   assert @client.destroy
 end

 def test_cannot_destroy_active_client_with_orders
   @order =create(:order,client: @client)
   @client.update_attribute(:active,false)
   assert !@client.destroy
   @order.destroy
   assert @client.destroy
 end 
end
