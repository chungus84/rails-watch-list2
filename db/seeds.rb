# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

puts 'Purging Movie Database'
Movie.destroy_all
puts 'Purge complete'

puts 'reading movie API'
response = JSON.parse(URI.open('https://tmdb.lewagon.com/movie/top_rated').read)

puts 'looping through API response'
response['results'].each do |movie|
  puts "creating #{movie['title']}"
  Movie.create!(title: movie['title'],
                overview: movie['overview'],
                poster_url: "https://image.tmdb.org/t/p/w500/#{movie['backdrop_path']}",
                rating: movie['vote_average'])
end
puts 'seeding complete'
