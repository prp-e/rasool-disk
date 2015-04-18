require 'rubygems'
require 'highline/import'

print 'Enter device number: '
dev = gets.chomp
password = ask("Enter your password: "){|c| c.echo = "*"}



while (Dir.entries('/media/dvdrw') - %w{. ..}).empty? == true
    system 'eject /dev/sr1'
    system 'sleep 10'
    system 'eject -t /dev/sr1'
    system 'sleep 20'
    system "echo #{password} | sudo -S mount /dev/sr#{dev} /media/dvdrw"
    system 'sleep 15'
end
