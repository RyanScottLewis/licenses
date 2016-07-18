require 'pathname'
require 'forwardable'

require 'licenses/version'
require 'licenses/license'

# Provides an easy way to generate common project license files.
module Licenses
  class << self
    extend Forwardable

    def_delegator License, :find, :find_license

    # Get the path to the root directory for the {Licenses} project
    #
    # @return [Pathname]
    # @api private
    # @since 0.1.0
    def path
      @path ||= Pathname.new(__FILE__).join(*%w(.. ..)).expand_path
    end
  end
end
