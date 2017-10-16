require 'socket'

csocket, psocket = Socket.pair(:UNIX, :DGRAM, 0)
maxlen = 1000

fork do
  psocket.close

  4.times do
    is = csocket.recv(maxlen)
    csocket.send("#{is} accomplished", 0)
  end
end

csocket.close

2.times do
  psocket.send('Heavy lifting!', 0)
end

2.times do
  psocket.send('Feather lifting!', 0)
end

4.times do
  $stdout.puts psocket.recv(maxlen)
end