# description            = Faker::Name.name
# complete_status          = Faker::Internet.email
require 'faker'
 
1000.times do
  description              = Faker::Name.name
  complete_status          = [true, false][rand(2)]
  Task.create!(:description => description, :complete_status => complete_status)
end
