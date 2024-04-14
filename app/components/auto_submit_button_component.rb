# frozen_string_literal: true

class AutoSubmitButtonComponent < ViewComponent::Base
  def initialize(url:)
    @url = url
  end
end
