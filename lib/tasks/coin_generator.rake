require 'rbzip2'

namespace :coins do
  desc "Generate Coins"
  
  task generate: :environment do
   # 10000 Euro
   euros = 100
   dinars = euros * 10
   @root_uuid = get_root_uuid

   for i in 1..dinars do
     @coins = generate_coins(100)
     Coin.bulk_insert(@coins)
   end
   md5_check_file 
  end

private

  def generate_coins(amount)
    coins = []
   (amount).times do
     coins << generate
   end
   return coins
  end

  def generate
    uuid = Digest::SHA1.hexdigest([Time.now, rand].join) 
    md5  = Digest::MD5.hexdigest("#{uuid}_#{@root_uuid}") 
   {root_uuid: @root_uuid, uuid: uuid, md5: md5, spent: false}
  end

  def get_root_uuid
    first = Coin.first
    if first.nil?
     uuid = UUID.new
     uuid.generate
    else
     first.root_uuid
    end
  end

  def md5_check_file
   data = Coin.pluck(:md5)
   CoinCheck.bulk_insert(data.map{|x| {md5: x}})
   file = File.open('coin_check.bz2','wb')      # open the target file
   bz2  = RBzip2.default_adapter::Compressor.new file  # wrap the file into the compressor
   bz2.write data.to_json                     # write the raw data to the compressor
   bz2.close
  end 

end
