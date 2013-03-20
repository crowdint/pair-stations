unless File.exists?("/Applications/Postgres.app")

  remote_file "#{Chef::Config[:file_cache_path]}/Postgres.zip" do
    source "http://postgresapp.com/download"
    owner WS_USER
  end

  execute "unzip Postgres.app" do
    command "unzip #{Chef::Config[:file_cache_path]}/Postgres.zip -d #{Chef::Config[:file_cache_path]}/"
    user WS_USER
  end

  execute "copy Postgres to /Applications" do
    command "mv #{Chef::Config[:file_cache_path]}/Postgres.app #{Regexp.escape("/Applications/Postgres.app")}"
    user WS_USER
    group "admin"
  end

  ruby_block "test to see if Postgres.app was installed" do
    block do
      raise "Postgres.app was not installed" unless File.exists?("/Applications/Postgres.app")
    end
  end

end
