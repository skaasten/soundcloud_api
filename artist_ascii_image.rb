require('soundcloud')
require('optparse')
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: artist_ascii_image.rb [options]"

  opts.on("-c", "--clientid CLIENTID", "clientid") do |clientid|
    options[:clientid] = clientid
  end

  opts.on("-a", "--artist ARTIST", "artist") do |artist|
    options[:artist] = artist
  end

end.parse!

client = SoundCloud.new({:client_id => options[:clientid],
                          :client_secret => options[:secret],
                          :username => options[:username],
                          :password => options[:password]})
artist = client.get("/users/#{options[:artist]}")
STDOUT.print(`jp2a #{artist.avatar_url}`)
