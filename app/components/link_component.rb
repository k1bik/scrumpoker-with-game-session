# frozen_string_literal: true

class LinkComponent < ViewComponent::Base
  def initialize(text:, href:, turbo: true, classes: nil)
    @text = text
    @href = href
    @turbo = turbo
    @classes = ["", classes]
  end
end
