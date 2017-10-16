child_process = 3
dead_process = 0

child_process.times do
  fork do
    sleep 3
  end
end

trap :CHLD do
  puts Process.wait
  dead_process += 1
  exit if child_process == dead_process
end

loop do
  sleep 1
end