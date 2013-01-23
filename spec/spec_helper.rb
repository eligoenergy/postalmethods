begin
  require 'spec'
  require 'mocha'
rescue LoadError
  require 'rubygems'
  require 'spec'
  require 'mocha'
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'postalmethods'

$VERBOSE = nil ##silence annoying warnings from soap4r

PM_OPTS = {:api_key=>'1a7ba530-d926-4b17-aaae-2ea215ff25fd'}

# hash hacks to make hacking in specs easier
class Hash
  # for excluding keys
  def except(*exclusions)
    self.reject { |key, value| exclusions.include? key.to_sym }
  end
 
  # for overriding keys
  def with(overrides = {})
    self.merge overrides
  end
end

require "ruby-debug"
