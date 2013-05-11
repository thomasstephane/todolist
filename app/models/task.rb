class Task < ActiveRecord::Base

  belongs_to :list

  def complete
    self.complete_status = true
    self.save
  end

  def printer
    puts "#{self.id} [X]: #{self.description}" if self.complete_status == true
    puts "#{self.id} [_]: #{self.description}" if self.complete_status == false || self.complete_status == nil
  end
end
