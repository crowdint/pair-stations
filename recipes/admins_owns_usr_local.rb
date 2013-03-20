directory "/usr/local/bin" do
  owner WS_USER
  recursive true
end

execute "admin groups can write on /usr/local" do
  command "chown -R #{WS_USER} /usr/local"
  command "chgrp -R admin /usr/local"
  command "chmod -R g+w /usr/local"
end
