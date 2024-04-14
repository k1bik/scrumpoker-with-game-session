# frozen_string_literal: true

class LinkComponent < ViewComponent::Base
  def initialize(text:, href:, turbo: true, classes: nil, data: {})
    @text = text
    @href = href
    @turbo = turbo
    @data = {turbo: turbo}.merge(data)
    @classes = ["", classes]
  end
end
