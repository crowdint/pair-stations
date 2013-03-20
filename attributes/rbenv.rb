unless node["rbenv"]
  node.default["rbenv"]= {
    "rubies" => {
        "1.9.3-p392" => { :env => {"CC" => "clang"}}
      },
    "default_ruby" => "1.9.3-p392"
  }
end
