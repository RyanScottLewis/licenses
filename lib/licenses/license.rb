require 'uri'

module Licenses
  # A software license.
  class License
    class << self
      # Get all licenses
      #
      # @example
      #   Licenses::License.all # => [#<License:0x000...>, ...]
      # @return [<License>]
      # @api public
      # @since v0.1.0
      def all
        @all ||= []
      end

      # Find a license by it's attributes
      #
      # @example
      #   Licenses::License.find(shortname: :mit) # => #<License:0x000...>
      # @return [License, nil]
      # @api public
      # @since v0.1.0
      def find(attributes = {})
        # attributes = attributes.to_h
      end
      alias [] find
    end

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
    def initialize(attributes = {})
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
      value = convert_string(value)
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
      @shortname.nil? ? convert_underscore(@name).to_sym : @shortname
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
      @shortname = convert_underscore(value).to_sym
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
      value = URI.parse(convert_string(value)) unless value.is_a?(URI::HTTP)

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
      @template.nil? ? convert_underscore(shortname) : @template
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
      @template = convert_underscore(value)
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

    # Convert a given value to stripped String
    #
    # @param [Object] value
    # @return [String]
    # @api private
    # @since v0.1.0
    def convert_string(value)
      value.to_s.strip
    end

    # Convert a given value to an underscored String
    #
    # @param [Object] value
    # @return [Symbol]
    # @api private
    # @since v0.1.0
    def convert_underscore(value)
      value.to_s
           .strip
           .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
           .gsub(/([a-z\d])([A-Z])/, '\1_\2')
           .tr('-', '_')
           .gsub(/\s/, '_')
           .gsub(/__+/, '_')
           .downcase
    end
  end
end
