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
 *= require substance-pagestyle.css
```

#### Support
This gem is provided as-is. Issues should be reported here on [Github Issues](https://github.com/CDLUC3/substance-rails/issues)
Please be advised though that we can only provide limited support for your local installations. 

#### Contribute
Fork this repository and make your modifications in a new branch. Then create a pull request to our 'development' branch (We will not accept pull request made against the 'master' branch). 

#### License 
This project uses the <a href="./LICENSE.md">MIT License</a>.
