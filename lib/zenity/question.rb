module Zenity
  class Question < Dialog
    def initialize(text)
      super("question".freeze, { text: text })
    end
  end
end
