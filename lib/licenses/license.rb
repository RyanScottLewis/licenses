require 'uri'

require 'licenses/helpers/formatting'

module Licenses
  # A software license.
  #
  # @since 0.1.0
  class License
    class << self
      include Helpers::Formatting

      # Get all licenses
      #
      # @example
      #   Licenses::License.all # => [#<License:0x000...>, ...]
      # @return [<License>]
      # @api public
      # @since v0.1.0
      def all
        @all ||= [].freeze
      end

      # Register a license
      #
      # @example
      #   Licenses::License.all # => []
      #
      #   license = Licenses::License.new(name: 'My License')
      #   Licenses::License.register(license)
      #
      #   Licenses::License.all # => [#<License:0x000...>, ...]
      # @return [License]
      # @api public
      # @since v0.1.0
      def register(license)
        raise TypeError, "license must be a #{License}" unless license.is_a?(License)

        @all = (all + [license]).freeze

        license
      end

      # Find a license by it's attributes
      #
      # @example
      #   Licenses::License.find(shortname: :mit) # => #<License:0x000...>
      # @return [License, nil]
      # @api public
      # @since v0.1.0
      def find(attributes={})
        attributes = attributes.to_h

        all.find { |license| license.matches?(attributes) }
      end
      alias [] find
    end

    include Helpers::Formatting

    # Create a new license
    #
    # @example
    #   license = Licenses::License.new(
    #     name:  'My License',
    #     shortname: :ml,
    #     url:   'https://example.org/my-license.txt'
    #   )
    # @api public
    # @since v0.1.0
    def initialize(attributes={})
      update_attributes(attributes)

      raise ArgumentError, 'name must be given' if @name.nil?
    end

    # Get the name
    #
    # @example
    #   license = Licenses::License.new(name: 'My License')
    #
    #   p license.name # => "My License"
    # @return [String]
    # @api public
    # @since v0.1.0
    attr_reader :name

    # Set the name
    #
    # @example
    #   license = Licenses::License.new(name: 'My License')
    #
    #   p license.name # => "My License"
    #   license.name = "Our License"
    #   p license.name # => "Our License"
    # @param [#to_s] value
    # @return [String]
    # @api public
    # @since v0.1.0
    def name=(value)
      value = format_string(value)
      value = nil if value.empty?

      raise ArgumentError, 'name must not be empty' if value.nil?

      @name = value
    end

    # Get the shortname
    #
    # @example
    #   license = Licenses::License.new(name: 'My License', shortname: :ml)
    #
    #   p license.shortname # => :ml
    # @example Generated from name
    #   license = Licenses::License.new(name: 'My License')
    #
    #   p license.shortname # => :my_license
    # @return [Symbol]
    # @api public
    # @since v0.1.0
    def shortname
      @shortname.nil? ? format_underscore(@name).to_sym : @shortname
    end

    # Set the shortname
    #
    # @example
    #   license = Licenses::License.new(name: 'My License')
    #
    #   p license.shortname # => :my_license
    #   license.shortname = :ml
    #   p license.shortname # => :ml
    # @param [#to_s] value
    # @return [String]
    # @api public
    # @since v0.1.0
    def shortname=(value)
      @shortname = format_underscore(value).to_sym
    end

    # Get the url
    #
    # @example
    #   license = Licenses::License.new(name: 'My License', url: 'https://example.org/my-license.txt')
    #
    #   p license.url # => #<URI::HTTP:0x000 URL:https://example.org/my-license.txt>
    # @return [Symbol]
    # @api public
    # @since v0.1.0
    attr_reader :url

    # Set the url
    #
    # @example
    #   license = Licenses::License.new(name: 'My License')
    #
    #   p license.url # => nil
    #   license.url = 'https://example.org/my-license.txt'
    #   p license.url # => #<URI::HTTP:0x000 URL:https://example.org/my-license.txt>
    # @param [URI::HTTP, #to_s] value
    # @return [URI::HTTP]
    # @api public
    # @since v0.1.0
    def url=(value)
      value = URI.parse(format_string(value)) unless value.is_a?(URI::HTTP)

      @url = value
    end

    # Get the template name
    #
    # @example
    #   license = Licenses::License.new(name: 'My License', template: :ml)
    #
    #   p license.template # => "ml"
    # @example Generated from shortname
    #   license = Licenses::License.new(name: 'My License', shortname: ml)
    #
    #   p license.template # => "ml"
    # @example Generated from shortname, generated from name
    #   license = Licenses::License.new(name: 'My License')
    #
    #   p license.shortname    # => :my_license
    #   p license.template # => :my_license
    # @return [Symbol]
    # @api public
    # @since v0.1.0
    def template
      @template.nil? ? format_underscore(shortname) : @template
    end

    # Set the template
    #
    # @example
    #   license = Licenses::License.new(name: 'My License')
    #
    #   p license.template # => "my_license"
    #   license.template = :ml
    #   p license.template # => :ml
    # @param [#to_s] value
    # @return [String]
    # @api public
    # @since v0.1.0
    def template=(value)
      @template = format_underscore(value)
    end

    # Check whether this licence matches the given attributes
    #
    # @example
    #   license = Licenses::License.new(shortname: :mit) # => #<License:0x000...>
    #
    #   Licenses::License.matches?(shortname: :mit)      # => true
    #   Licenses::License.matches?(shortname: :foobar)   # => false
    # @return [#to_h]
    # @api public
    # @since v0.1.0
    def matches?(attributes) # rubocop:disable Metrics/AbcSize
      result = %I[name shortname url template].any? { |key| attributes.key?(key) }

      result &= value_matches?(@name,     attributes[:name])      if attributes.key?(:name)
      result &= value_matches?(shortname, attributes[:shortname]) if attributes.key?(:shortname)
      result &= value_matches?(@url,      attributes[:url])       if attributes.key?(:url)
      result &= value_matches?(template,  attributes[:template])  if attributes.key?(:template)

      result
    end

    protected

    # Update the attributes on this object
    #
    # @param [#to_h] attributes
    # @return [Hash]
    # @api private
    # @since v0.1.0
    def update_attributes(attributes)
      attributes.to_h.each { |name, value| send("#{name}=", value) }
    end

    # Check whether the values given matches
    #
    # @param [Regexp, #to_s] value
    # @return [Boolean]
    # @api private
    # @since v0.1.0
    def value_matches?(value, expectation)
      value = format_string(value)

      expectation.class == Regexp ? value =~ expectation : value == format_string(expectation)
    end
  end
end
