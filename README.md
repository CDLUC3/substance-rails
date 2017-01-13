## Substance Forms For Rails 4

[![Build Status](https://travis-ci.org/CDLUC3/substance-rails.svg)](https://travis-ci.org/CDLUC3/substance-rails)

[Substance Forms](https://github.com/substance/forms) is a Javascript library that allows you to provide your users to edit page content. This gem integrates the Substance Forms libraries into the Rails asset pipeline.

The gem currently provides your application with:
* Substance Forms [0.1.0](https://github.com/substance/forms/releases/tag/v0.1.0)
* Fontawesome [4.7.0](https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css) - Used to display the icons found on the Substance-forms toolbar.

#### Dependencies
* Rails 4.1+

#### Installation
Add the following line to your Gemfile and then run ```> bundle install ```
```ruby
gem "substance-rails"
```

#### Usage
Add substance-forms javascript files to your app/assets/javascripts/application.js
```js
//= require substance/substance.js
//= require substance-forms.js
```

Add substance-forms stylesheets to the top of your app/assets/stylesheets/application.css. You may need to include your applications custom css file after these lines to prevent the substance styles from overriding your own.
```css
 *= require substance-forms.css
 *= require substance.next.css
 *= require font-awesome.min.css
```

You can also optionally include the following substance stylesheets. See the [Substance Forms](https://github.com/substance/forms) repository for specific details
```css
 *= require substance-pagestyle.css
 *= require substance-pagestyle.next.css
 *= require substance-reset.css
 *= require substance-reset.next.css
```

Add the javascript handlers to the top of you pages that will use the substance editor. The handlers will transfer the content of your substance text areas over to a hidden input field that will be passed to your controller once the form has been submitted by the user.
```html
	<script type="text/javascript">
		<%= substance_javascript_handler_for_text_areas.html_safe %>
	</script>
```

Then add Substance text areas within your forms by calling the helper and passing it your object and the name of the attribute that the text area should be tied to.
You can add multiple substance text areas to a single form.
```html
  <form method='POST'>
		
		<!-- You other form elements here -->
		
		<%= substance_text_area_tag(user, 'bio').html_safe %>
		
		<!-- You other form elements here -->
		
	</form>
```

The above helper will produce the following html:
```html
  <div class="sc-rich-text-area">
		<div tabindex="2" data-id="answer-e1515e043be1eff3c87d" 
		     spellcheck="false" contenteditable="true"
				 class="sc-surface sc-container-editor container-node answer-e1515e043be1eff3c87d sm-enabled">
				 
				 <p data-id="paragraph-1" class=" sc-text-block sc-paragraph">
					 <span data-path="paragraph-1.content" class="sc-text-property" style="white-space:pre-wrap"></span>
				 </p>
		</div>
	</div>
	
  <input id="hidden-text-for-user-e1515e043be1eff3c87d" 
	       name="user[bio]" type="hidden"
				 value="<p data-id=&quot;paragraph-1&quot;>jhgfkjrhkjrhlkrjlkrj<strong data-id=&quot;strong-48e33ff110e4b6443f3d59bd335e7657&quot;>lkr</strong></p>">
```

#### Support
This gem is provided as-is. Issues should be reported here on [Github Issues](https://github.com/CDLUC3/substance-rails/issues)
Please be advised though that we can only provide limited support for your local installations. 

#### Contribute
Fork this repository and make your modifications in a new branch. Then create a pull request to our 'development' branch (We will not accept pull request made against the 'master' branch). 

#### License 
This project uses the <a href="./LICENSE.md">MIT License</a>.
