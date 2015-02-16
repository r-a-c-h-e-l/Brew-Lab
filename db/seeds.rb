# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Beer.create(beer_name: 'Mo Fuggles', beer_type: 'lager', user_id: 1, phaseX: 4)
Beer.create(beer_name: 'Bitter Old Bastard', beer_type: 'bitter', user_id: 1, phaseX: 2)
Beer.create(beer_name: 'Black Beauty', beer_type: 'stout', user_id:2, phaseX: 1 )
