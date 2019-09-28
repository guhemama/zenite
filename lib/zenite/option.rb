# frozen_string_literals: true

module Zenite
  module Option
    def self.included(base)
      base.send :include, InstanceMethods
      base.extend ClassMethods
    end

    module InstanceMethods
    end

    module ClassMethods
      # Define an instance variable
      def option(name, required, *constraints)
        class_eval { attr_accessor name }
      end
    end
  end
end