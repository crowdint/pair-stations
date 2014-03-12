execute "add rbenv aliases plugin" do
  command "mkdir -p ~/.rbenv/plugins"
  command "git clone git://github.com/tpope/rbenv-aliases.git ~/.rbenv/plugins/rbenv-aliases"
  command "rbenv alias --auto"
end
