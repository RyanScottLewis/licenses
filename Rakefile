# -= Bundler Gem Tasks =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #

require 'bundler/gem_tasks'

# -= RSpec Tasks =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

# -= Yard Tasks =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

require 'yard'
require 'yardstick/rake/measurement'
require 'yardstick/rake/verify'

YARD::Rake::YardocTask.new

task :yardstick do
  config = Yardstick::Config.coerce(path: 'lib/**/*.rb')
  measurements = Yardstick.measure(config)
  
  measurements.puts
end

# -= Rubocop Tasks =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #

require 'rubocop/rake_task'

RuboCop::RakeTask.new
