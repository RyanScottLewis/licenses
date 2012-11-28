# Simple usage:

license = Licenses::MIT.new do |l|
  l.year.start  = 2012
  l.author.name  = 'Ryan Scott Lewis'
  l.author.email = 'ryan@rynet.us'
end

p license.to_s # => "Copyright (c) 2012 Ryan Scott Lewis <ryan@rynet.us>\n\nPermission is hereby granted, free of charge..."

# Multiple authors:

license = Licenses::MIT.new do |l|
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

# Smart setters:

license = Licenses::MIT.new do |l|
  # l.type = Licenses::Software::MIT # Set which type of License here instead
  l.year = '2006-2011' # Will set year.start to 2006 and year.end to 2011
  l.authors = 'Ryan Scott Lewis<ryan@rynet>, John Doe     <    john.doe@example.com   >' 
end

p license.to_s # => "Copyright (c) 2012 Ryan Scott Lewis <ryan@rynet.us>, John Doe <john.doe@example.com>\n\nPermission is hereby granted, free of charge..."

# Advanced usage (preferred method):

license = Licenses::MIT.new do # Do not pass block variables to enter the scope of the License::Software
  year 2012
  author 'Ryan Scott Lewis <ryan@rynet.us>'
end

p license.to_s # => "Copyright (c) 2012 Ryan Scott Lewis <ryan@rynet.us>\n\nPermission is hereby granted, free of charge..."
