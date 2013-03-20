crowdint_workstation_defaults "show hard drive on desktop" do
  domain 'com.apple.finder'
  key 'ShowHardDrivesOnDesktop'
  boolean true
end

crowdint_workstation_defaults "show external hard drives on desktop" do
  domain 'com.apple.finder'
  key 'ShowExternalHardDrivesOnDesktop'
  boolean true
end

crowdint_workstation_defaults "show removable media on desktop" do
  domain 'com.apple.finder'
  key 'ShowRemovableMediaOnDesktop'
  boolean true
end

ruby_block "Show User Home In Sidebar" do
  username = ENV['SUDO_USER']
  block do
    system(
    "osascript -e '
      tell application \"Finder\"
        activate
        delay 1
        set user_home to folder \"#{username}\" of folder \"Users\" of Startup disk
        select user_home
        delay 1
        tell application \"System Events\" to tell process \"Finder\" to keystroke \"t\" using command down
        close window 1
      end tell'"
    )
  end
end
