#!/usr/bin/expect
#用户名和IP
spawn ssh root@000.00.000.000
expect "*password:"
#用户名对应的密码
send "Your password\r"
expect "*#"
interact 
