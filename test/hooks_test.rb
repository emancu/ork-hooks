require_relative 'helper'

class Event
  include Ork::Document
  include Ork::Hooks

  @@hooks_called = []
end

Protest.describe 'Ork::Hooks' do
  context 'include Ork::Hooks' do
    test 'raise an error if it is not a Ork::Document' do
      assert_raise Ork::NotOrkObject do
        class NotADocument
          include Ork::Hooks
        end
      end
    end

    test 'add hooks method' do
      event = Event.new

      assert event.respond_to? :before_create
      assert event.respond_to? :before_delete
      assert event.respond_to? :before_update
      assert event.respond_to? :before_save

      assert event.respond_to? :after_create
      assert event.respond_to? :after_delete
      assert event.respond_to? :after_update
      assert event.respond_to? :after_save
    end
  end

  context '' do
    class Event
      def hooks_called
        @@hooks_called
      end

      def before_create
        @@hooks_called << :before_create
      end

      def before_update
        @@hooks_called << :before_update
      end

      def before_save
        @@hooks_called << :before_save
      end

      def before_delete
        @@hooks_called << :before_delete
      end

      def after_create
        @@hooks_called << :after_create
      end

      def after_update
        @@hooks_called << :after_update
      end

      def after_save
        @@hooks_called << :after_save
      end

      def after_delete
        @@hooks_called << :after_delete
      end
    end

    context 'create' do
      test 'hooks were called in order' do
        @event = Event.create

        assert_equal :before_create, @event.hooks_called.shift
        assert_equal :before_save,   @event.hooks_called.shift
        assert_equal :after_create,  @event.hooks_called.shift
        assert_equal :after_save,    @event.hooks_called.shift
        assert @event.hooks_called.empty?
      end
    end

    context 'update' do
      test 'hooks were called in order' do
        @event = Event.create
        @event.hooks_called.replace []
        @event.save

        assert_equal :before_update, @event.hooks_called.shift
        assert_equal :before_save,   @event.hooks_called.shift
        assert_equal :after_update,  @event.hooks_called.shift
        assert_equal :after_save,    @event.hooks_called.shift
        assert @event.hooks_called.empty?
      end
    end

    context 'delete' do
      test 'hooks were called in order' do
        @event = Event.create
        @event.hooks_called.replace []
        @event.delete

        assert_equal :before_delete, @event.hooks_called.shift
        assert_equal :after_delete,  @event.hooks_called.shift
        assert @event.hooks_called.empty?
      end
    end
  end
end
