brew "bash"
brew "bash-completion"
brew "ack"
brew "coreutils"
brew "findutils"
brew "git"
brew "watch"
brew "wget"

brew "http://raw.github.com/Homebrew/homebrew-dupes/master/apple-gcc42.rb"
dmg_package "XQuartz" do
  source "http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.4.dmg"
  action :install
  volumes_dir "XQuartz-2.7.4"
  checksum "3f7c156fc4b13e3f0d0e44523ef2bd3cf7ea736126616dd2da28abb31840923c"
  type "pkg"
  owner WS_USER
  package_id "org.macosforge.xquartz.pkg"
end
brew "imagemagick"

dmg_package "DiffMerge" do
  volumes_dir "DiffMerge 3.3.2.1139"
  source "http://download-us.sourcegear.com/DiffMerge/3.3.2/DiffMerge.3.3.2.1139.dmg"
  checksum "aa1579bd60d7c05eb055e8d898223d6cc4ac5d6c1998bbc641adc5a2760a4841"
  action :install
end
