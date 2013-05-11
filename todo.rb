require_relative 'config/application'
require_relative 'app/controllers/tasks_controller'


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
  puts "'list' -to list all tasks from a list"
  puts "'add' -to add a task to a list"
  puts "'delete' -to delete a task from a list"
  puts "'complete' -to mark a task complete"
  puts "'list_all' -to list all the tasks from all of the lists"
  puts "'list:outstanding' -to list all of the outstanding tasks from all of the lists"
  puts "'by_tag' -enter keywords to view related tasks from all lists"


end
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
when "list_all"
  List.where('name => ?', actionable_item)[0].list_all
when "list:outstanding"
  List.outstanding
when "list:completed"
  List.completed
when "by_tag"
  List.by_tag(actionable_item.split(" "))
when "help"
  display_menu
else
  raise "I don't know what you're talking about"
end



