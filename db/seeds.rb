# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 User.create(:email => 'superadmin@gmail.com', :password => '12345678', :password_confirmation => '12345678', :role => 'super_admin', :active => 'Active', :username => 'super_admin',:confirmation_token => '',:confirmed_at => Time.now)
 User.create(:email => 'admins@gmail.com', :password => '12345678', :password_confirmation => '12345678', :role => 'admin', :active => 'Active', :username => 'admin',:confirmation_token => '',:confirmed_at => Time.now)
 