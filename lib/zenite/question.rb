module Zenite
  class Question < Dialog
    def text=(text)
      @opts[:text] = text
    end
  end
end
