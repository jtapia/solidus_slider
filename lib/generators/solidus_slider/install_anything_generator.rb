# frozen_string_literal: true

module SolidusSlider
  class InstallAnythingGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def install
      # Copy slider partial
      copy_file 'anything_slider.html.erb', "app/views/spree/shared/_slider.html.erb"

      # Add javascripts
      append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require js/jquery.anythingslider\n"
      append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require js/jquery.anythingslider.fx\n"
      append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require js/jquery.anythingslider.video\n"

      # Add stylesheets
      inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require css/anythingslider\n", before: /\*\//, verbose: true

      # Copy migrations
      run 'bundle exec rake railties:install:migrations FROM=solidus_slider'

      # Run migrations
      res = ask 'Would you like to run the migrations now? [Y/n]'
      if res.casecmp('y').zero?
        run 'bundle exec rake db:migrate'
      else
        puts 'Skiping rake db:migrate, don\'t forget to run it!'
      end
    end
  end
end
