# Crowdint Workstation 
A repeatable, documented, decomposable, shareable and iterative OSX (ruby) development environment


Features
--------
Crowdint Workstation automates the process of installing common applications such as Google Chrome, Firefox, homebrew, and RubyMine, Sets OSX preferences such as dock hiding or key repeat rate and configures command line tools such as git.


Installation
------------

Before start ensure you have the latest Xcode installed and accept the xcode agreement

First create the manifest files needed to install the packages, for the aditional accounts you have to run it again with the changing the recipe on soloistrc to *meta_osx_pair*

```bash
sudo gem install chef -v11.4.0
cat > ~/Cheffile <<EOF
site "http://community.opscode.com/api/v1"

cookbook "crowdint_workstation",
         :git => "git://github.com/crowdint/pair-stations.git"
EOF

cat > ~/soloistrc <<EOF
recipes:
  - crowdint_workstation::meta_osx_base
EOF
sudo gem install soloist
soloist
```

After the script finish to run, you will need to set the passwords manually to the 2 others accounts created, due macosx issues when create a user from command line.

* pair
* admin
