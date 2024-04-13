# frozen_string_literal: true

class PasswordInputComponent < ViewComponent::Base
  def initialize(id:, name:, value: nil, classes: nil, maxlength: nil, errors: [])
    @id = id
    @name = name
    @value = value
    @classes = ["rounded-md focus:ring-blue-400 focus:border-blue-400 w-full text-sm", classes]
    @maxlength = maxlength
    @errors = errors
  end
end
