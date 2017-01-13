module Substance
  module Rails
    module Helper
   
      # Setup a handler for Substance-Forms Text Areas that transfers
      # the user edited text to a hidden field that Rails will pass
      # on to the controller during form submission
      # -----------------------------------------------------------
      def substance_javascript_handler_for_text_areas
        <<-JAVASCRIPT
          function _handleChange(identifier){
            let forms = window.substanceForms;
            let data = { 
              text: forms.getHTML('substance-text-area-' + identifier) 
            };

            $("#hidden-text-for-" + identifier).val(data['text']);
          }
        JAVASCRIPT
      end
   
   
      # Create a Substance-Forms Text Area
      # -----------------------------------------------------------
      def substance_text_area_tag(obj, attribute_name)
        identifier = "#{obj.class.name.downcase}-#{obj.id}"
        
        <<-HTML
        <div id="substance-text-area-#{identifier}" 
             editable data-type="area" 
             onclick="_handleChange(#{identifier});">
          model.send(atrribute_name.to_sym)
        </div>

        <input type="hidden" id="hidden-text-for-#{identifier}" 
               name="#{obj.class.name.downcase}[attribute]" 
               val="#{obj.send(attribute_name.to_sym)}" />
        HTML
      end
    end
  end
end