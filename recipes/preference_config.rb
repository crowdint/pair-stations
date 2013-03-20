# Disable Front Row
execute "move front row out of the way" do
  command "mv /System/Library/CoreServices/Front\\ Row.app /System/Library/CoreServices/Front_Row_disabled.app"
  not_if { File.exists?("/System/Library/CoreServices/Front_Row_disabled.app") }
  only_if { File.exists?("/System/Library/CoreServices/Front\\ Row.app") }
end

# Display full path on finder
crowdint_workstation_defaults "set finder to display full path in title bar" do
  domain 'com.apple.finder'
  key '_FXShowPosixPathInTitle'
  boolean true
end

crowdint_workstation_defaults "ask for password when screen is locked" do
  domain 'com.apple.screensaver'
  key 'askForPassword'
  integer 1
end

crowdint_workstation_defaults "wait 60 seconds between screensaver & lock" do
  domain 'com.apple.screensaver'
  key 'askForPasswordDelay'
  float 5
end

plist_dir = ENV['HOME'] + "/Library/Preferences/ByHost"
Dir["#{plist_dir}/com.apple.screensaver.*.plist"].each do |file|
  crowdint_workstation_defaults "set screensaver timeout" do
    domain file.chomp('plist')
    key 'idleTime'
    integer 600
  end
end

execute "set display, disk and computer sleep times" do
  command "pmset -a displaysleep 20 disksleep 15 sleep 0"
end
