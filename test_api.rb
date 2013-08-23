require('soundcloud')
require('optparse')
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: test_api.rb [options]"

  opts.on("-c", "--clientid CLIENTID", "clientid") do |clientid|
    options[:clientid] = clientid
  end

  opts.on("-s", "--secret SECRET", "client secret") do |clientid|
    options[:secret] = clientid
  end

  opts.on("-u", "--username USERNAME", "username") do |username|
    options[:username] = username
  end

  opts.on("-p", "--password PASSWORD", "password") do |password|
    options[:password] = password
  end

end.parse!

client = SoundCloud.new({:client_id => options[:clientid],
                          :client_secret => options[:secret],
                          :username => options[:username],
                          :password => options[:password]})
tracks = client.get('/me/tracks')
tracks.each do |track|
  p track.title, track.waveform_url, track.bpm, track.playback_count
end
