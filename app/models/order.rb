class Order < ApplicationRecord
  belongs_to :client
  before_save :order_id

private

 def order_id
  self.oid = "#{self.client.id}-#{rand(1000 .. 99999)}-#{Date.today}"
 end

end

