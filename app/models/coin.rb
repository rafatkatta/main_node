class Coin < ApplicationRecord
  before_save :uuids_and_md5_check
  after_save :create_coin_check

  private

  def uuids_and_md5_check
    self.root_uuid = get_root_uuid if self.root_uuid.nil?
    self.uuid = Digest::SHA1.hexdigest([Time.now, rand].join) if self.uuid.nil?
    self.md5  = Digest::SHA1.hexdigest("#{self.uuid}_#{self.root_uuid}") if self.md5.nil?
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

  def create_coin_check
    CoinCheck.create!(md5: self.md5)
  end
end
