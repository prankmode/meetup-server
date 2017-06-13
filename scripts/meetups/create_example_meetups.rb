# frozen_string_literal: true

require 'json'

file = File.read('exampleMeetups.json')

meetups = JSON.parse(file)

puts "there are #{meetups.count} meetups"

open('seeds.rb', 'w') do |f|
  # seeds for the repo table
  f.puts 'Meetups.destroy_all'
  f.puts 'Users.destroy_all'

  f.puts "u  = User.create({email: \"maud\", password: \"maud\", password_confirmation: \"maud\"})"
  f.puts "u2 = User.create({email: \"harriet\", password: \"harriet\", password_confirmation: \"harriet\"})"

  f.puts 'Meetup.create! ['

  meetups.each do |r|
    f.puts "{name: \"#{r['name']}\", plain_text_description: \"#{r['description']}\", event_id: \"#{r['event_id']}\", short_link: \"#{r['event_url']}\", user_id: u.id },"
  end

  f.puts ']'
end
