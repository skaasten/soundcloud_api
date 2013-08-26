require('soundcloud')

CLIENT_ID = '99054db844f287a9755eddf13a87cf2b'

if ARGV.length != 1 
  puts "Usage: ruby artist_ascii_image.rb ARTIST_NAME"
  exit
end

client = SoundCloud.new({:client_id => CLIENT_ID})

artist_name = ARGV[0]
begin
  artist = client.get("/users/#{artist_name}")
rescue
  puts "Could not find artist '#{artist_name}'"
  exit
end 

puts artist.avatar_url
if artist.avatar_url.include? "default_avatar"
  puts "Artist #{artist_name} does not have an cover image."
  exit
else
  STDOUT.print(`jp2a --colors #{artist.avatar_url}`) 
end
