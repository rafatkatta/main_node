require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
   @client = create(:client)
  end

  def test_order_ve_oid
   order = create(:order, client: @client)
   assert_equal @client.orders.count, 1
   assert_not @client.orders.first.oid.nil?
  end

  def test_orders_get_oid
   order = create_list(:order, 5, client: @client)
   oids = @client.orders.pluck(:oid)
   assert_equal oids.length, oids.uniq.length
  end
end
