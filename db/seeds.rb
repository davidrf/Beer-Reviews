# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[
'Scotch Ale',
'Bock',
'Barleywine',
'Blonde Ale',
'Light Beer',
'Quadrupel Ale',
'Tripel Ale',
'Dubbel Ale',
'Gose',
'Hefeweizen',
'Double IPA',
'Imperial Stout',
'Brown Ale',
'Sour',
'Saison/Farmhouse Ale',
'Fruit Beer',
'Pale Ale',
'Pilsner',
'Amber Ale',
'Red Ale',
'Wheat',
'Porter',
'IPA',
'Lager',
'Stout'
].each do |style_name|
  Style.find_or_create_by!(name: style_name)
end
