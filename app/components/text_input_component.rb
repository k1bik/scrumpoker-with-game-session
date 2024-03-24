# frozen_string_literal: true

class TextInputComponent < ViewComponent::Base
  def initialize(id: nil, error_container_id: nil, name: nil, value: nil, classes: nil, maxlength: nil, errors: [])
    @id = id
    @error_container_id = error_container_id
    @name = name
    @value = value
    @classes = ["rounded-md focus:ring-red-400 focus:border-red-400 w-full text-sm", classes]
    @maxlength = maxlength
    @errors = errors
  end
end
