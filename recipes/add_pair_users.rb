require 'etc'

=begin
For create Accounts use the dscl command. This example would create the user "admin", like so:
  dscl . -create /Users/admin
  dscl . -create /Users/admin UserShell /bin/bash
  dscl . -create /Users/admin RealName "Administrator"
  dscl . -create /Users/admin UniqueID "502"
  dscl . -create /Users/admin PrimaryGroupID 80
  dscl . -create /Users/admin NFSHomeDirectory /Users/admin

You can then use passwd to change the user's password, or use:
  dscl . -passwd /Users/admin password

You'll have to create /Users/admin for the user's home directory and change ownership so the user can access it, and be sure that the UniqueID is in fact unique.

This line will add the user to the administrator's group:
  dscl . -append /Groups/admin GroupMembership admin

These lines will remove the user
  sudo dscl . delete /users/admin
  sudo rm /private/var/db/dslocal/nodes/Default/users/admin.plist
=end

usernames = ['admin', 'pair']
password = 'cr0wd1nt'

usernames.each_with_index do |new_user, i|
  puts ">>>>>> Creating user #{new_user}: #{system("dscl . list /Users/#{new_user}")}"

  unless system("dscl . list /Users/#{new_user}")

    # Find the first available uid > 500 so it shows up in System Preferences
    uids = `dscl . -list /Users UniqueID`.split("\n").collect { |pair| pair.squeeze(" ").split(" ").last.to_i }
    uid = 501
    while ( uids.include?(uid) )
      uid += 1
    end
    uid += i

    # Create the new user
    [
      "dscl . -create /Users/#{new_user}",
      "dscl . -create /Users/#{new_user} UserShell /bin/bash",
      "dscl . -create /Users/#{new_user} RealName \"#{new_user}\"",
      "dscl . -create /Users/#{new_user} UniqueID #{uid}",
      "dscl . -create /Users/#{new_user} PrimaryGroupID 80",
      "dscl . -create /Users/#{new_user} NFSHomeDirectory /Users/#{new_user}",
      "dscl . -passwd /Users/admin #{password}",

    ].each do |cmd|
      puts cmd
      execute cmd
    end

    # Create the user's home directory
    [
      "sudo cp -R '/System/Library/User Template/English.lproj/' /Users/#{new_user}",
      "sudo chown -R #{new_user}:staff /Users/#{new_user}"
    ].each do |cmd|
      puts cmd
      execute cmd
    end unless File.directory?("/Users/#{new_user}")

    # Append user to admin group
    group "admin" do
      members [new_user]
      append true
    end
  end
end

