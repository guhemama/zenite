# frozen_string_literal: true

module Zenite
  class Question < Dialog
    option :text, true, :string

    def dialog_opts
      raise InvalidArgumentException, 'You must enter a text.' if @text.nil?

      { text: @text }
    end
  end
end
