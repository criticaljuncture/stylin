# Stylin

Stylin is a Rails engine that simplifies the setup of a living styleguide
for your application.

Stylin builds on the work of KSS (http://github.com/kneath/kss) and adds
default controllers and views so that you can get to work on features.

# Installation

* Add the stylin gem to your Gemfile and bundle
```ruby
gem "stylin", "~>0.0.1"
```

* Install the gem.

```console
rake generate stylin:install
```

This creates a 'stylin.yml' file under config/ that allows customization
of Stylin as well as creating a directory for the html portions of your
styleguides under 'app/styleguides'. This will also add a route to your
routes file that mounts Stylin at '/styleguides'.

* Configure Stylin as desired (see Configuration below).

# Getting Started

Stylin uses KSS to scan your stylesheets directory looking for SASS, SCSS,
and CSS files that contain KSS style documentation.

While KSS supports simple example html in its documentation format, Stylin
does not use this. Instead it will look for an HTML file of the same name as
the CSS file it is attempting to display. For example, when displaying a CSS
file named _buttons.css_, Stylin will look for a file named _buttons.html_ in
app/styleguides (or in whatever directory you configure - see Configuration
below). This allows for more complex html that your components are likely to
consist of.

This is all you need to get started.

# Application Preview

If you'd like to see a preview of what Stylin provides you can do so by
cloning this repository, navigating to 'spec/dummy' and running:
```console
rails s -p 7654
```
Then in your browser go to 'http://localhost:7654/stylin/styleguides'.

# Configuration

Aspects of Stylin can be configured by adding lines to the 'stylin.yml' that
was created under your 'config/' directory. See below for specific options.

* Stylesheets path

By default Stylin will look for your stylesheets under `app/assets/stylesheets`.
This is the default location for all Rails 3 & Rails 4 projects.

Example Config:

```yaml
stylesheets_path: path/to/stylesheets
```

* HTML Styleguide

Stylin will look for a html file that corresponds to the current stylesheet
that it is attempting to display (attempting to display _buttons.css_ will
mean Stylin looks for a file named _buttons.html_). By default Stylin will
look for these html files under 'app/styleguides'

Example Config:

```yaml
html_styleguides_path: path/to/styleguide_html
```

* Styleguide Sections

By default Stylin creates an ordered navigation based on the sections
specified in your stylesheets. This will often look somthing like:
1.1 Buttons
1.2 Lists
2.1 Forms
2.1.1 Checkboxes
2.1.2 Autocompleters

To make organization easier Stylin supports defining of top level styleguide
section names. For example you may want to group the above list as follows:
1 Generic Elements
  1.1 Buttons
  1.2 Lists
2 Form Elements
  2.1 Forms
  2.1.1 Checkboxes
  2.1.2 Autocompleters

Example Config:

```yaml
section_groupings:
  1: Generic Elements
  2: Form Elements
```

# Configuring the views

Stylin attempts to get you quickly started with a living styleguide but
eventually your organization may need more control over how you display
or organize your styleguide. You can customize the default Stylin views
by running the following:

```ruby
rake generate stylin:views
```

This will copy all the Stylin view files into your 'app/views/directory'
where you can customize them.

# Development

To hack on Stylin, you'll need to install dependencies with bundle install.
Run tests with rake.
