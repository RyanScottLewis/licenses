require 'licenses'

module Licenses
  class License
    
    class << self
      
      def inherited(subclass)
        Licenses.names << subclass
      end
      
    end
    
  end
end
