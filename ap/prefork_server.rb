require 'socket'

socket = TCPServer.open('0.0.0.0', 8080)

[:INT, :QUIT].each do |signal|
  Signal.trap(signal) do
    wpids.each do |wpid|
      Process.kill(signal, wpid)
    end
  end
end

wpids = []

5.times do
  wpids << fork do
    loop do
      connection = socket.accept
      connection.puts 'Hello Readers!'
      connection.close
    end
  end
end

Process.waitall