require 'version'

module Licenses
  is_versioned
  
  class << self
    
    def all
      @all ||= []
    end
    
    def types
      all.collect(&:type)
    end
    
    def names
      all.collect(&:name)
    end
    
  end
end

require 'licenses/mit'
require 'licenses/gpl'
