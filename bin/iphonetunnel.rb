#!/usr/bin/env ruby

user=ARGV[0]

voldir="/Volumes/#{user}@JB"

if FileTest.exist? voldir
  print `umount #{voldir}`
end

print `mkdir #{voldir}`
print `/Applications/SSHFS\\ GUI.app/Contents/Resources/sshfs-static-leopard -p 2222 #{user}@localhost: #{voldir} -o volname=#{user}@JB`
