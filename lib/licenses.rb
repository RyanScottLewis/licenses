require 'pathname'
require 'forwardable'

require 'licenses/version'
require 'licenses/license'

# Provides an easy way to generate common project license files.
#
# @since 0.1.0
module Licenses
  class << self
    extend Forwardable

    # @method find_license
    # Find a license by it's attributes
    #
    # @example
    #   Licenses.find_license(shortname: :mit) # => #<License:0x000...>
    # @return [License, nil]
    # @api public
    # @since 0.1.0
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
