# -= Bundler Gem Tasks =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #

require 'bundler/gem_tasks'

# -= RSpec Tasks =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

# -= Yard Tasks =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

require 'yard'
require 'yardstick/rake/measurement'

YARD::Rake::YardocTask.new

task :yardstick do
  Yardstick.measure.puts
end

# -= Rubocop Tasks =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #

require 'rubocop/rake_task'

RuboCop::RakeTask.new
