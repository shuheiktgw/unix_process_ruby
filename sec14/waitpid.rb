favorite = fork do
  exit 77
end

middle_child = fork do
  abort 'aborted!!!'
end

_pid, status = Process.waitpid2 favorite
puts status.exitstatus