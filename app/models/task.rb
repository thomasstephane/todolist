class Task < ActiveRecord::Base
  def complete
    self.complete_status = true
    self.save
  end

  def to_s
    "#{self.id} [_]: #{self.description}" if self.complete_status == false
    "#{self.id} [X]: #{self.description}" if self.complete_status == true
  end
end
