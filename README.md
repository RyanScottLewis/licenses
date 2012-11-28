# Licenses

Create software licenses easily.

## Install

### Bundler: `gem 'licenses'`

### RubyGems: `gem install licenses`

## Usage

### Creating

#### Simple

```ruby
license = License::MIT.new do |l|
  l.year.start  = 2012
  l.author.name  = 'Ryan Scott Lewis'
  l.author.email = 'ryan@rynet.us'
end

p license.to_s # => "Copyright (c) 2012 Ryan Scott Lewis <ryan@rynet.us>\n\nPermission is hereby granted, free of charge..."
```

##### Multiple Authors

```ruby
license = License::MIT.new do |l|
  l.year.start  = 2012
  l.authors.add name: 'Ryan Scott Lewis', email: 'ryan@rynet.us'
  l.authors.add name: 'John Doe', email: 'john.doe@example.com'
  l.authors.add name: 'Snake Pliskin'
  l.authors.add 'John McClane <john@mcclain.org, jmcclane@gmail.com>'
end

p license.to_s # => "Copyright (c) 2012 Ryan Scott Lewis <ryan@rynet.us>, John Doe <john.doe@example.com>\n\nPermission is hereby granted, free of charge..."
p license.authors.first.name # => 'Ryan Scott Lewis'
p license.authors.first.email # => 'ryan@rynet.us'
p license.authors.last.name # => 'John McClane'
p license.authors.last.email # => 'john@mcclain.org'
p license.authors.last.emails # => ['john@mcclain.org', 'jmcclane@gmail.com]
```

##### Smart Setters

```ruby
license = License::Software.new do |l|
  l.type = License::Software::MIT # Set which type of license here instead
  l.year = '2006-2011' # Will set year.start to 2006 and year.end to 2011
  l.authors = 'Ryan Scott Lewis<ryan@rynet>, John Doe     <    john.doe@example.com   >' 
end

p license.to_s # => "Copyright (c) 2012 Ryan Scott Lewis <ryan@rynet.us>, John Doe <john.doe@example.com>\n\nPermission is hereby granted, free of charge..."
```

##### Advanced

> Note:  This is the preferred method.

Do not pass block variables to enter the scope of the License::Software.

```ruby
license = License::Software.new do
  type MIT
  year 2012
  author 'Ryan Scott Lewis <ryan@rynet.us>'
end

p license.to_s # => "Copyright (c) 2012 Ryan Scott Lewis <ryan@rynet.us>\n\nPermission is hereby granted, free of charge..."
```

## Contributing

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright © 2012 Ryan Scott Lewis <ryan@rynet.us>.

The MIT License (MIT) - See LICENSE for further details.