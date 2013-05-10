require_relative 'config/application'
require_relative 'app/controllers/tasks_controller'

# puts "Put your application code in #{File.expand_path(__FILE__)}"


first_action    = ARGV[0]
actionable_item = ARGV[1..-1].join(" ")

case first_action
when "list"
  TasksController.print_all 
when "add"
  TasksController.new_task(actionable_item) 
when "delete"
  TasksController.delete(actionable_item) 
when "complete"
  TasksController.complete(actionable_item)
else
  raise "I don't know what you're talking about"
end
