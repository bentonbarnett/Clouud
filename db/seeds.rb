# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Create nickname colors
Color.find_or_create_by_hex("EDAFC0")
Color.find_or_create_by_hex("626E69")
Color.find_or_create_by_hex("AD808D")
Color.find_or_create_by_hex("909B8A")

