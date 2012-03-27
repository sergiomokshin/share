namespace :share do

 require 'iconv'

 $rails_rake_task = true
 require(File.join(Rails.root, 'config', 'environment'))

 desc "Load Database"
 task :loaddatabase do
     
   Rake::Task['share:users'].invoke
   Rake::Task['share:categories'].invoke
   
 end
 
private
 task :users do
  puts "Load Users"
  
  user = User.new  

  user.provider = "fake"
  user.uid = "123456"
  user.name = "User Test"
  user.email = "user@test.com"
  user.active = true
  user.save
  @user_id = user.id

  puts "Load Users Successfully"

 end 
  2

 task :categories do
  puts "Load Categories"
  
  category = Category.new
  category.description = "Category 1"
  category.color = "000000"
  category.user_id = @user_id
  category.active = true
  category.save

  category = Category.new
  category.description = "Category 2"
  category.color = "000000"
  category.user_id = @user_id
  category.active = true
  category.save

  puts "Load Categories Successfully"
 end 
end