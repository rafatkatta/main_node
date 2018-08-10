class Edinar

  attr_accessor :checksum, :coins, :amount

  def initialize(amount = 0)
    @amount = Integer(100 * amount)
    if @amount == 0
      @coins = [nil]
    else 
      @coins = Coin.limit(@amount).order(:id).where(spent: false)
      @coins.update_all(spent: true)
      @coins = @coins.map{|c| {root_uuid: c.root_uuid, uuid: c.uuid, md5: c.md5}}
    end
    @checksum = Digest::MD5.hexdigest(@coins.to_s) 
  end

  def coins
    @coins
  end
  
  def checksum
    @checksum
  end

  def amount
    @amount
  end

  def valid?
    @checksum == Digest::MD5.hexdigest(@coins.to_s) && @coins.count == @amount
  end

  def verified?
   @coins.collect{|c| Digest::MD5.hexdigest("#{c[:uuid]}_#{c[:root_uuid]}") == c[:md5]}.all?
  end

end
