require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "rails/test_unit/railtie"

if defined?(Bundler)
  Bundler.require *Rails.groups(:assets)
end

module PictureFinder
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.action_dispatch.x_sendfile_header = nil
  end
end
