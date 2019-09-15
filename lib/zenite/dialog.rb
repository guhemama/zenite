require 'open3'

module Zenite
  class Dialog
    attr_reader :dialog_type, :opts, :stdout, :stderr, :status
    attr_accessor :width, :height, :timeout

    def initialize
      @opts = {}
    end

    def display
      @stdout, @stderr, @status = Open3.capture3(to_cmd)
    end

    def to_cmd
      "zenity --#{dialog_type} #{dialog_opts}"
    end

    protected
    def dialog_type
      self.class
          .name
          .split('::')
          .last
          .downcase
    end

    def dialog_opts
      @opts
          .merge(general_opts)
          .map { |opt, val| %{--#{opt.to_s}="#{val}"} }
          .join " "
    end

    def general_opts
      { width: @width,
        height: @height,
        timeout: @timeout
      }.filter { |_, v| !!v }
    end

    def method_missing(method_name, *args, &block)
      if method_name === :text
        @opts[:method_name] = args[0]
      else
        super
      end
    end
  end
end
