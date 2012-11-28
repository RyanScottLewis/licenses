require 'spec_helper'

describe Licenses::License, '.new' do
  
  context 'When no arguments are given' do
    
    subject { Licenses::License.new }
    
    it 'should create an instance of Licenses::License' do
      subject.class.should == Licenses::License
    end
    
  end
  
  context 'When one argument is given' do
    
    context 'and it is a subclass of Licenses::License' do
      
      subject { Licenses::License.new(Licenses::MIT) }
      
      it 'should initialize a new instance of the subclass given' do
        subject.class.should == Licenses::MIT
      end
      
    end
    
    context 'and it is a Symbol or responds to #to_sym' do
      
      context 'and it exists as a key within Licenses.keys' do
        
        subject { Licenses::License.new(:mit) }
        
        it 'should initialize a new instance of the sublcass mapped to the value within Licenses.keys' do
          subject.class.should == Licenses::MIT
        end
        
      end
      
      context 'and it doesnt exist as a key within Licenses.keys' do
        
        it 'should raise Licenses::UnknownLicence' do
          expect { Licenses::License.new(:foo) }.to raise_error(Licenses::UnknownLicenceError)
        end
        
      end
      
    end
    
    context 'and it is an Array' do
        
      it 'should raise Licenses::ArgumentError' do
        expect { Licenses::License.new([:mit, :gpl]) }.to raise_error(Licenses::ArgumentError)
      end
      
    end
    
  end
  
  context 'When a block is given' do
    
    context 'and a block variable is given' do
      
      it 'should yield the block with the current instance' do
        
        Licenses::License.new(:mit) { |licence| licence.class.should == Licenses::MIT }
        
      end
      
    end
    
    context 'and a block variable is not given' do
      
      it 'should call #instance_eval on the instance with the block' do
        
        Licenses::License.new(:mit) { self.class.should == Licenses::MIT }
        
      end
      
    end
    
  end
  
end
