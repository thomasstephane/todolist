require_relative '../models/task'

class TasksController  < ActiveRecord::Base
  def self.new_task(task)
    Task.create!(:description => task)
    puts "new #{task}"
  end

  def self.print_all
    Task.all.each{|task| task.printer}
  end

  def self.complete(task_id)
    Task.where('id = ?',task_id)[0].complete
  end

  def self.delete(task_id)
    Task.delete(:id => task_id)
    puts "delete #{task_id}"
  end
end
