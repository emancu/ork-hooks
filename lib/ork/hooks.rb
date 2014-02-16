module Ork
  module Hooks
    VERSION = '0.0.1'

    def self.included(klass)
      raise Ork::NotOrkObject unless klass.included_modules.include? Ork::Document

      klass.class_eval do |base|
        def save_with_hooks
          is_new = self.new?

          before_create if is_new
          before_update unless is_new
          before_save

          result = save_without_hooks

          after_create if is_new
          after_update unless is_new
          after_save

          result
        end

        alias :save_without_hooks :save
        alias :save :save_with_hooks

        def delete_with_hooks
          before_delete

          result = delete_without_hooks

          after_delete

          result
        end

        alias :delete_without_hooks :delete
        alias :delete :delete_with_hooks
      end
    end

    protected

    def before_create
    end

    def before_update
    end

    def before_save
    end

    def before_delete
    end

    def after_create
    end

    def after_update
    end

    def after_save
    end

    def after_delete
    end
  end
end

