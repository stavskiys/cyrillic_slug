require "the_string_to_slug"

module CyrillicSlug
  class Generator
    attr_reader :controller, :options

    def initialize(controller, options)
      @controller = controller
      @options = options
    end

    def build_slug(value)
      controller.render json: { options[:output_param_name] => value.to_slug_param }
    end
  end

  module ActionControllerMethods
    extend ActiveSupport::Concern

    module ClassMethods
      def include_generate_cyrillyc_slug_method(options = {})
        final_options = {
          method_name: 'generate_cyrillic_slug',
          param_name: 'name',
          output_param_name: 'slug'
        }.merge(options)

        define_method final_options[:method_name] do
          Generator.new(self, final_options).build_slug(params[final_options[:param_name]])
        end
      end
    end
  end

  class Railtie < Rails::Railtie
    initializer "cyrillic_slug_configuration.on_rails_init" do |app|
      ActionController::Base.send :include, CyrillicSlug::ActionControllerMethods
    end
  end

  class Engine < Rails::Engine
  end
end
