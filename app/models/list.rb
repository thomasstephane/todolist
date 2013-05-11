class List < ActiveRecord::Base
  has_many :tasks

  def list_all
    Task.where('list_id = ?', self.id).each do |task|
      task.printer
    end
  end

  def self.completed
    Task.where('complete_status = ?', true).order("created_at").each do |task|
      task.printer
    end
  end

  def self.outstanding
    Task.where('complete_status = ?', false).order("completed_at").each do |task|
      task.printer
    end
  end

  def self.by_tag(*tag)
    Task.where('description = ?', *tag).order("created_at").each do |task|
      task.printer
    end
  end
end
