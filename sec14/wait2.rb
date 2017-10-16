5.times do
  fork do
    if rand(5).even?
      exit 111
    else
      exit 222
    end
  end
end

5.times do
  _, status = Process.wait2
  puts "#{status}!!!!!!!!"
end