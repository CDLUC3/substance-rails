require 'rails'

module Substance
  module Rails
    class Engine < ::Rails::Engine
    
      # Add Substance-Forms to the Rails asset pipeline
      # ---------------------------------------------------------------
      initializer "precompile", :group => :all do |app|
        app.config.assets.precompile << "font-awesome.min.css"
        
        app.config.assets.precompile << "substance/*"
        app.config.assets.precompile << "substance-forms.js"
        app.config.assets.precompile << "substance-forms.css"
      end
    
      # Make this gem's HTML helper methods available to Views
      # ---------------------------------------------------------------
      initializer "helper" do |app|
        ActiveSupport.on_load(:action_view) do
          include Helper
        end
      end
    
    end 
  end
end