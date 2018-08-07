require 'test_helper'

class CoinTest < ActiveSupport::TestCase
  
  def setup
    @coin = create(:coin)
    @coins = create_list(:coin, 25)
  end

  def test_coin_is_valid
    assert @coin.valid?
  end
  
  def test_coins_ve_same_root
   root_uuids =  @coins.pluck(:root_uuid)
   assert root_uuids.compact.length, 1
  end 

  def test_coins_ve_different_uuid
   uuids = @coins.pluck(:uuid)
   assert_equal uuids.length, uuids.uniq.length
  end

  def test_coins_ve_different_md5
   mds = @coins.pluck(:md5)
   assert_equal mds.length, mds.uniq.length
  end
  
  def test_if_coin_checks_exist
   assert_equal CoinCheck.count, Coin.count
  end
end
