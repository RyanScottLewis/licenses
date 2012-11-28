# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "licenses"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Scott Lewis"]
  s.date = "2012-11-28"
  s.description = "# License\n\nCreate software licenses easily.\n\n## Install\n\n### Bundler: `gem 'license'`\n\n### RubyGems: `gem install license`\n\n## Usage\n\n### Simple\n\n```ruby\nlicense = License::Software::MIT.new do |l|\n  l.year.start  = 2012\n  l.author.name  = 'Ryan Scott Lewis'\n  l.author.email = 'ryan@rynet.us'\nend\n\np license.to_s # => \"Copyright (c) 2012 Ryan Scott Lewis <ryan@rynet.us>\\n\\nPermission is hereby granted, free of charge...\"\n```\n\n### Multiple Authors\n\n```ruby\nlicense = License::Software::MIT.new do |l|\n  l.year.start  = 2012\n  l.authors.add name: 'Ryan Scott Lewis', email: 'ryan@rynet.us'\n  l.authors.add name: 'John Doe', email: 'john.doe@example.com'\n  l.authors.add name: 'Snake Pliskin'\n  l.authors.add 'John McClane <john@mcclain.org, jmcclane@gmail.com>'\nend\n\np license.to_s # => \"Copyright (c) 2012 Ryan Scott Lewis <ryan@rynet.us>, John Doe <john.doe@example.com>\\n\\nPermission is hereby granted, free of charge...\"\np license.authors.first.name # => 'Ryan Scott Lewis'\np license.authors.first.email # => 'ryan@rynet.us'\np license.authors.last.name # => 'John McClane'\np license.authors.last.email # => 'john@mcclain.org'\np license.authors.last.emails # => ['john@mcclain.org', 'jmcclane@gmail.com]\n```\n\n#### Smart Setters\n\n```ruby\nlicense = License::Software.new do |l|\n  l.type = License::Software::MIT # Set which type of license here instead\n  l.year = '2006-2011' # Will set year.start to 2006 and year.end to 2011\n  l.authors = 'Ryan Scott Lewis<ryan@rynet>, John Doe     <    john.doe@example.com   >' \nend\n\np license.to_s # => \"Copyright (c) 2012 Ryan Scott Lewis <ryan@rynet.us>, John Doe <john.doe@example.com>\\n\\nPermission is hereby granted, free of charge...\"\n```\n\n#### Advanced usage (preferred method)\n\n```ruby\nlicense = License::Software.new do # Do not pass block variables to enter the scope of the License::Software\n  type MIT\n  year 2012\n  author 'Ryan Scott Lewis <ryan@rynet.us>'\nend\n\np license.to_s # => \"Copyright (c) 2012 Ryan Scott Lewis <ryan@rynet.us>\\n\\nPermission is hereby granted, free of charge...\"\n```\n\n## Contributing\n\n* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet\n* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it\n* Fork the project\n* Start a feature/bugfix branch\n* Commit and push until you are happy with your contribution\n* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.\n* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.\n\n## Copyright\n\nCopyright \u{a9} 2012 Ryan Scott Lewis <ryan@rynet.us>.\n\nThe MIT License (MIT) - See LICENSE for further details."
  s.email = "ryan@rynet.us"
  s.files = ["Gemfile", "Guardfile", "LICENSE", "README.md", "Rakefile", "VERSION", "examples/software.rb", "lib/licenses.rb", "lib/licenses/gpl.rb", "lib/licenses/license.rb", "lib/licenses/mit.rb", "licenses/MIT.erb", "spec/licenses/software/_new_spec.rb", "spec/spec_helper.rb"]
  s.homepage = "http://github.com/RyanScottLewis/licenses"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Easily generate software license files."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<version>, ["~> 1.0.0"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 2.1"])
      s.add_development_dependency(%q<guard-yard>, ["~> 2.0"])
      s.add_development_dependency(%q<rb-fsevent>, ["~> 0.9"])
      s.add_development_dependency(%q<fuubar>, ["~> 1.1"])
      s.add_development_dependency(%q<redcarpet>, ["~> 2.2.2"])
      s.add_development_dependency(%q<github-markup>, ["~> 0.7"])
    else
      s.add_dependency(%q<version>, ["~> 1.0.0"])
      s.add_dependency(%q<guard-rspec>, ["~> 2.1"])
      s.add_dependency(%q<guard-yard>, ["~> 2.0"])
      s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
      s.add_dependency(%q<fuubar>, ["~> 1.1"])
      s.add_dependency(%q<redcarpet>, ["~> 2.2.2"])
      s.add_dependency(%q<github-markup>, ["~> 0.7"])
    end
  else
    s.add_dependency(%q<version>, ["~> 1.0.0"])
    s.add_dependency(%q<guard-rspec>, ["~> 2.1"])
    s.add_dependency(%q<guard-yard>, ["~> 2.0"])
    s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
    s.add_dependency(%q<fuubar>, ["~> 1.1"])
    s.add_dependency(%q<redcarpet>, ["~> 2.2.2"])
    s.add_dependency(%q<github-markup>, ["~> 0.7"])
  end
end
