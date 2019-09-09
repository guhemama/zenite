module Zenity
  class Dialog
    @dialog_type = nil

    def initialize(dialog_type, opts)
      @dialog_type = dialog_type
      @opts = opts
    end

    def display
      exec to_cmd
    end

    def to_cmd
      "zenity --#{dialog_type} #{dialog_opts}"
    end

    protected
    def dialog_type
      raise Zenity::Error, "Dialog type was not set." unless @dialog_type
      @dialog_type
    end

    def dialog_opts
      @opts
        .map { |opt, val| "--#{opt.to_s}=\"#{val}\"" }
        .join " "
    end
  end
end
