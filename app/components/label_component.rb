# frozen_string_literal: true

class LabelComponent < ViewComponent::Base
  def initialize(required: false)
    @required = required
  end
end
