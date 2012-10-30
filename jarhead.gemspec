require "jarhead/version"

Gem::Specification.new do |gem|
  gem.authors       = ["Nathan Lilienthal"]
  gem.email         = ["nathanlil13@me.com"]
  gem.description   = %q{A better way to interact with Java.}
  gem.summary       = %q{An assistant to ease the pains of working with Java.}
  gem.homepage      = "http://github.com/Epicgrim/jarhead"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.name          = "jarhead"
  gem.version       = Jarhead::VERSION

  gem.add_runtime_dependency "thor"
  gem.add_runtime_dependency "highline"
  gem.add_runtime_dependency "net-ssh"
  gem.add_runtime_dependency "net-sftp"
  gem.add_development_dependency "rake"
end