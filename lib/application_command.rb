# frozen_string_literal: true

# Base class which defines common instruments for services through the project.
# Use .call class method shortcut to call such service.
# Define #call instance method with functionality you want to perform.
# This helps you to keep clean internal state of service + fits well SRP principle

class ApplicationCommand
  def self.call(*args)
    instance = args[0].is_a?(Hash) && args.one? ? new(**args.shift) : new(*args)
    instance.call.tap do |result|
      return yield(result) if block_given?
    end
  end

  def call
    raise NotImplementedError, 'Define #call method!'
  end
end
