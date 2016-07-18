module Licenses
  module Helpers
    # Helpers for formatting objects.
    #
    # @since 0.1.0
    module Formatting
      protected

      # Convert a given value to stripped String
      #
      # @param [Object] value
      # @return [String]
      # @api private
      # @since v0.1.0
      def format_string(value)
        value.to_s.strip
      end

      # Convert a given value to an underscored String
      #
      # @param [Object] value
      # @return [String]
      # @api private
      # @since v0.1.0
      def format_underscore(value)
        value.to_s
             .strip
             .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
             .gsub(/([a-z\d])([A-Z])/, '\1_\2')
             .tr('-', '_')
             .tr('.', '_')
             .gsub(/\s/, '_')
             .gsub(/__+/, '_')
             .downcase
      end
    end
  end
end
