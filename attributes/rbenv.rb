unless node["rbenv"]
  node.default["rbenv"]= {
    "rubies" => {
        "2.0.0-p247" => { :env => {"CC" => "clang"}}
      },
    "default_ruby" => "2.0.0-p247"
  }
end
