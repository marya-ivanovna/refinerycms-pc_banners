module Refinery
  module Banners
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Banners

      engine_name :refinery_banners

      initializer "register refinerycms_banners plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_banners"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.banners_admin_banners_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/banners/banner',
            :title => 'name'
          }
          
        end
      end

      config.to_prepare do
        require 'page_extensions'
        Refinery::Page.send :include, Refinery::Banners::Extensions::Page
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Banners)
      end
    end
  end
end
