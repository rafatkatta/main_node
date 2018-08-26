class Order < ApplicationRecord
  belongs_to :client
  before_save :order_id

  before_destroy do
    unless self.closed?
      throw(:abort)
    else
      true
    end 
  end

  def closed?
    self.closed
  end  

private

 def order_id
  self.oid = "#{self.client.id}-#{rand(1000 .. 99999)}-#{Date.today}"
 end

end

