# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AdminUser.all.each do |item|
	item.destroy
end
AdminUser.create!(email: 'admin@zara.com', password: '12345678', password_confirmation: '12345678', role: 'admin') if Rails.env.development?
AdminUser.create!(email: 'user@zara.com', password: '11111111', password_confirmation: '11111111', role: 'user') if Rails.env.development?
