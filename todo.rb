require_relative 'config/application'
require_relative 'app/controllers/tasks_controller'
require_relative 'app/controllers/lists_controller'


def display_menu
  string = <<-MENU
___________        .___     .____    .__          __          
\\\__    ___/___   __| _/____ |    |   |__| _______/  |_  ______
  |    | /  _ \\ / __ |/  _ \\\|    |   |  |/  ___/\\   __\\\/  ___/
  |    |(  <_> ) /_/ (  <_> )    |___|  |\\\___ \\  |  |  \\\___ \\ 
  |____| \\\____/\\\____ |\\\____/|_______ \\\__/____  > |__| /____  >
                    \\\/              \\\/       \\\/            \\\/ 
  MENU
  puts string
  puts "You can type the following commands:\n\n"
  puts "'list list_name' -to list all tasks from a list named list_name"
  puts "'add list_name' -to add a task to list_name"
  puts "'delete list_name' -to delete a task from a list_name"
  puts "'complete list_name' -to mark a task complete in list_name"
  puts "'list:outstanding' -to list all of the outstanding tasks from all of the lists"
  puts "'list:completed' -to list all of the completed tasks from all of the lists"
  puts "'by_tag' -enter keywords to view related tasks from all lists"
end


first_action    = ARGV[0]
separator = (first_action =~ /:/)
if separator.nil?
  action = first_action
else
  selected_list = first_action[0..(separator - 1)]
  action = first_action[(separator + 1)..(first_action.length - 1)]
end
list_name = ARGV[1]
actionable_item = ARGV[1..-1].join(" ")


case action
when "outstanding"
  ListsController.outstanding(selected_list)
when "completed"
  ListsController.completed(selected_list)
when "list"
  id = ListsController.name_to_id(actionable_item)
  TasksController.print_all(id)
when "add"
  id = ListsController.name_to_id(actionable_item)
  puts "What do you want to add?"
  task = STDIN.gets.chomp
  TasksController.new_task(task, id) 
when "delete"
  id = ListsController.name_to_id(actionable_item)
  puts "What do you want to delete?"
  task = STDIN.gets.chomp
  TasksController.delete(task, id) 
when "complete"
  id = ListsController.name_to_id(actionable_item)
  puts "What do you want to complete?"
  task = STDIN.gets.chomp
  TasksController.complete(task, id)
# when "by_tag"
#   TasksController.by_tag(actionable_item.split(" "))
when "help"
  display_menu
else
  raise "I don't know what you're talking about"
end



