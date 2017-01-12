require 'rails'

module Substance
  module Rails
    class Engine < ::Rails::Engine
    
      # ---------------------------------------------------------------
      initializer "precompile", :group => :all do |app|
        app.config.assets.precompile << "substance/*"
        app.config.assets.precompile << "substance-forms.js"
        app.config.assets.precompile << "substance-forms.css"
      end
    
    end 
  end
end