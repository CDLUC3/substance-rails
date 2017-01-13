require 'securerandom'

module Substance
  module Rails
    module Helper
   
      # Setup a handler for Substance-Forms Text Areas that transfers
      # the user edited text to a hidden field that Rails will pass
      # on to the controller during form submission
      # -----------------------------------------------------------
      def substance_javascript_handler_for_text_areas
        <<-JAVASCRIPT
          $( document ).ready(function() {
            /* Locate all of the forms that contain a substance text area */
            $('form').each(function(){
              if($(this).has(".sc-rich-text-area")){
                let form = this;
                
                $(form).submit(function(event){
                  /* Loop through all of the form's substance text areas and handle them */
                  $(form).find(".sc-rich-text-area .sc-container-editor").each(function(){

                    let identifier = $(this).attr('data-id');
                    _transferContent(identifier);
                  
                  });
                });
              }
            });
          });
          
          /* Transfer the contents of substance text area to the hidden field */
          function _transferContent(identifier){
            let forms = window.substanceForms;
            let data = { 
              text: forms.getHTML(identifier) 
            };

            $("#hidden-text-for-" + identifier).val(data['text']);
          }
        JAVASCRIPT
      end
   
   
      # Create a Substance-Forms Text Area
      # -----------------------------------------------------------
      def substance_text_area_tag(obj, attribute_name)
        if !obj.nil? && attribute_name.is_a?(String) && 
                                  obj.respond_to?(attribute_name)
          # Generate a unique identifier for the text area and its hidden field
          identifier = "#{obj.class.name.downcase}-#{SecureRandom.hex(10)}";
        
          # Substance Forms requires text area contents to be wrapped in a tag
          text = obj.send(attribute_name.to_sym)
          text = "<p>#{text}</p>" unless text.starts_with?("<")
      
          # Produce a text-area for substance and a hidden field for Rails
          <<-HTML
          <div id="#{identifier}" editable data-type="area">
            "#{text.html_safe}"
          </div>

          <input type="hidden" id="hidden-text-for-#{identifier}" 
                 name="#{obj.class.name.downcase}[#{attribute_name}]" />
          HTML
          
        else
          raise "substance-rails requires you to provide a valid obj and attribute_name. The Object must be able to responde to Object.attribute_name"
        end
      end
      
    end
  end
end