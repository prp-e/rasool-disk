require 'rubygems'
require 'highline/import'

password = ask("Enter your password: "){|c| c.echo = "*"}

cmd = system "echo #{password} | sudo -S mount /dev/sr1 /media"

while cmd != true
    system 'eject /dev/sr1'
    system 'sleep 10'
    system 'eject -t /dev/sr1'
    system 'sleep 20'
end
