module Substance
  module Rails
    module Helper
   
      # Setup a handler for Substance-Forms Text Areas that transfers
      # the user edited text to a hidden field that Rails will pass
      # on to the controller during form submission
      # -----------------------------------------------------------
      def substance_javascript_handler_for_text_areas
        <<-JAVASCRIPT
          let area = $(".substance-text-area:first");
          let formEvents = $._data($(area)[0], "events");

          /* If the form does not already have a submit handler */          
          if(formEvents.indexOf('submit') < 0){
            /* Loop through all of the form's substance text areas and handle them */
            $(area.form).submit(function(e){
              $(".substance-text-area").each(function(){
                let identifier = $(this).prop('id');
                _handleChange(identifier);
              });
            });
          }
        
          /* Transfer the contents of substance text area to the hidden field */
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
             editable data-type="area" class="substance-text-area">
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