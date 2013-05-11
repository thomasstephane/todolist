require 'rake'
require 'rspec/core/rake_task'

require_relative 'config/application'

desc "create the database"
task "db:create" do
  touch 'db/todolist.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm 'db/todolist.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  p File.dirname(__FILE__)
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the test database with sample data"
task "db:seed" do
  require APP_ROOT.join('db', 'seeds.rb')
end

desc "populate the test database with lists"
task "db:populate_list" do
  10.times { |i| List.create!(:name => "Named#{i + 1}")}
  Task.all.each do |task| 
    task.list_id = rand(10)
    task.save
  end
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r./config/application"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:spec)

task :default  => :specs
