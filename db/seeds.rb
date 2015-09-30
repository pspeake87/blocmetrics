require 'faker'
 
 # Create Posts
 50.times do
   RegisteredApplication.create!(
     name:  Faker::Lorem.word,
     url:   Faker::Internet.domain_name
   )
 end
 registered_applications = RegisteredApplication.all
 
 # Create Comments
 100.times do
   Event.create!(
     registered_application: registered_applications.sample,
     name: Faker::Lorem.word
   )
 end

puts "Seed finished"
 puts "#{RegisteredApplication.count} Registered applications created"
 puts "#{Event.count} Events created"