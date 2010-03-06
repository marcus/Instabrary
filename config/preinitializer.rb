class Pathname  
  def empty?  
    to_s.empty?  
  end  
end  
  
begin  
  # Require the preresolved locked set of gems.  
  require File.expand_path('../../.bundle/environment', __FILE__)  
rescue LoadError  
  # Fallback on doing the resolve at runtime.  
  require "rubygems"  
  require "bundler"  
  Bundler.setup  
end 
