require 'faker'
 
 #create users

  member1 = User.new(
   name:     'Member1 User',
   email:    'member1@example.com',
   password: 'helloworld'
 )
 member1.skip_confirmation!
 member1.save!
 
 member2 = User.new(
   name:     'Member2 User',
   email:    'member2@example.com',
   password: 'helloworld'
 )
 member2.skip_confirmation!
 member2.save!
 
 
 member3 = User.new(
   name:     'Member3 User',
   email:    'member3@example.com',
   password: 'helloworld'
 )
 member3.skip_confirmation!
 member3.save!


users = User.all
 # Create Posts
 50.times do
   RegisteredApplication.create!(
     user: users.sample,
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
 puts "#{User.count} Users created"