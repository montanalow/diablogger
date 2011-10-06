# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
ac = Author.create :pseudonym => "Anonymous Coward", :email => "ac@diablogger.net", :user => (User.new :id => 0)
montana = Author.create :pseudonym => "Montana Low", :email => "montanalow@gmail.com", :user => User.new
trey = Author.create :pseudonym => "Trey Stout", :email => "treystout@gmail.com", :user => User.new
