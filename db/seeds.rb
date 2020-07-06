# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Timer.destroy_all
User.destroy_all
Task.destroy_all
TaskChecklist.destroy_all
UserChecklist.destroy_all

puts "creating categories"
10.times do 
	Category.create(category_name: Faker::Color.color_name)
end

puts "creating checklist"
10.times do 
	Checklist.create(category_id: Category.all.sample.id, title: Faker::Military.navy_rank)
end

puts "creating timers"
10.times do 
	Timer.create(minutes: rand(1..100))
end

puts "creating tasks"
10.times do 
	Task.create(timer_id: Timer.all.sample.id, category_id: Category.all.sample.id, name: Faker::Job.key_skill, description: Faker::Job.employment_type)
end

puts "creating task-checklists"
10.times do 
	TaskChecklist.create(task_id: Task.all.sample.id, checklist_id: Checklist.all.sample.id)
end

puts "creating users"
10.times do 
	User.create(username: Faker::Music::GratefulDead.player, password: Faker::Color.hex_color )
end

puts "creating user-checklists"
10.times do
	UserChecklist.create(user_id: User.all.sample.id, checklist_id: Checklist.all.sample.id)
end
