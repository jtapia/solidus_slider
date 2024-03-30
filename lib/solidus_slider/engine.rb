# frozen_string_literal: true

require 'solidus_core'
require 'solidus_support'

module SolidusSlider
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_slider'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'solidus_slider.configure_backend' do
      next unless ::Spree::Backend::Config.respond_to?(:menu_items)

      ::Spree::Backend::Config.configure do |config|
        config.menu_items << config.class::MenuItem.new(
          label: :slides,
          icon: 'photo',
          url: :admin_slides_path,
          condition: -> { can?(:manage, ::Spree::Slide) },
          match_path: '/slides'
        )

        config.menu_items << config.class::MenuItem.new(
          label: :slide_locations,
          icon: 'wrench',
          url: :admin_slide_locations_path,
          condition: -> { can?(:manage, ::Spree::SlideLocation) },
          match_path: '/slide_locations'
        )
      end
    end
  end
end
