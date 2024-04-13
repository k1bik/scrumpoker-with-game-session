# frozen_string_literal: true

class SubmitButtonComponent < ViewComponent::Base
  def initialize(text:, classes: nil)
    @text = text
    @classes = ["cursor-pointer px-12 py-2 bg-black text-white rounded-lg font-bold", classes]
  end
end
