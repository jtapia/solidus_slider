# frozen_string_literal: true

# Don't build a dummy app with solidus_bolt enabled
ENV['SKIP_SOLIDUS_BOLT'] = 'true'

require 'solidus_dev_support/rake_tasks'
SolidusDevSupport::RakeTasks.install

task default: %w[extension:test_app extension:specs]
