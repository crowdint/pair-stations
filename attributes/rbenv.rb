unless node["rbenv"]
  node.default["rbenv"]= {
    "rubies" => {
        "2.0.0" => { :env => {"CC" => "clang", "CFLAGS" => "-march=native"}}
      },
    "default_ruby" => "2.0.0"
  }
end
