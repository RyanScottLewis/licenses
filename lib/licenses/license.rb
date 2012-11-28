require 'licenses'

module Licenses
  class License
    
    class << self
      
      def inherited(subclass)
        Licenses.all << subclass
      end
      
    end
    
  end
end
