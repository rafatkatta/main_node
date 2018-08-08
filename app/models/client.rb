class Client < ApplicationRecord
 domain_regex = /\A#{URI::regexp}\z/
 validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
 validates :domain, format: { with: domain_regex }

 validate :ipv4_valid?, :ipv6_valid?

 before_save :uuid_and_secret_key

 def connection_info
  self.domain || self.ipv4 || self.ipv6 
 end  

 private

 def uuid_and_secret_key
   if self.uuid.nil?
    uuid = UUID.new
    self.uuid = uuid.generate
   end
   self.secret_key = Digest::SHA1.hexdigest([Time.now, rand].join) if self.secret_key.nil?
 end 

 def ipv4_valid?
   IPAddr.new(self.ipv4).ipv4? unless self.ipv4.nil? 
 end

 def ipv6_valid?
   IPAddr.new(self.ipv6).ipv6? unless self.ipv6.nil?
 end
end
