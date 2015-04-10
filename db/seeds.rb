# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'csv'


CSV.foreach('db/data/style.csv', :headers => true) do |row|
  Style.find_or_create_by!(row.to_hash)
end

CSV.foreach('db/data/brewery.csv', :headers => true) do |row|
  Brewery.find_or_create_by!(row.to_hash)
end

user = User.find_by(email: "joeschmo@gmail.com")
if user.blank?
  user = User.new(email: "joeschmo@gmail.com", password: "12345678", password_confirmation: "12345678")
  user.save
end

CSV.foreach('db/data/beer.csv', :headers => true) do |row|
  style = Style.find_by(name: row["style"])
  brewery = Brewery.find_by(name: row["brewery"])
  info = row.to_hash
  beer = Beer.find_or_create_by!(name: info["name"], user: user, brewery: brewery, style: style, abv: info["abv"], ibu: info["ibu"], description: info["description"])
  beer.image = Rails.root.join("db/images/#{info["image"]}").open
  beer.save!
end
