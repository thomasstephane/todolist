require_relative '../models/task'

class TasksController  < ActiveRecord::Base
  def self.new_task(task,list_id)
    p task
    p list_id
    Task.create!(:description => task, :complete_status => false, :list_id => list_id)
  end

  def self.print_all(list_id)
    p list_id
    Task.where('list_id = ?',list_id).each{|task| task.printer}
  end

  def self.complete(task_id, list_id)
    Task.where('description = ? AND list_id = ?',task_id, list_id)[0].complete
  end

  def self.delete(task_id, list_id)
    Task.delete_all(['description = ? AND list_id = ?',task_id, list_id])
  end

  def self.completed(list_id)
    Task.where('complete_status = ? AND list_id = ?', true, list_id).order("created_at").each do |task|
      task.printer
    end
  end

  def self.outstanding(list_id)
    Task.where('complete_status = ? AND list_id = ?', false, list_id).order("completed_at").each do |task|
      task.printer
    end
  end

  def self.by_tag(*tag)
    Task.where('description = ?', *tag).order("created_at").each do |task|
      task.printer
    end
  end
end
