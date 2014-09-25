# 5631286221 Patcharapon Nuimark
# 5631321521 Vorrachet Udomvisedying
require 'sinatra'
require 'geocoder'
require 'timezone'

get '/' do 
	"Hello, World Peth :)"
end
get '/about' do
	"There is something around!!!"
end
get '/hello/?:name?' do
	"The word is: #{params[:name] ? params[:name] :'world'}"
end
get '/hi/?:tor?' do
	torr = params[:tor]
	"Hello #{torr ? torr :'Pass'}"
end

get '/time' do
  erb :form
end
 
Timezone::Configure.begin do |call| 
  call.username = 'peth'
end

post '/form' do
  meaung = params[:message]
  latlong = Geocoder.coordinates(meaung)
  timezone = Timezone::Zone.new(:latlon => latlong)
 
  #tn = timezone.time Time.now.strftime("%H:%M %p") # 2022-07-13 13:36:20 UTC
  tn = timezone.time Time.now
  th = tn.to_s.split(' ');
  time = th[1].split(':');
  hour = time[0];
  fhour = hour.to_i
  na_t = time[1].to_i;
  sec = time[2].to_i;
  secs = sec.to_s;
  if (sec<10)
    secs="0"+secs
  end
  if (fhour>12)
    fhour-=12
    ampm = " PM"
  else
    ampm = " AM"
  end
  "<left><h4>The current time in #{meaung} is </h4><h3> #{fhour}:#{na_t}:#{secs}:#{ampm} </h3><center/>"
end