# frozen_string_literal: true

require 'open3'

module Zenite
  class Dialog
    include Option

    attr_reader :dialog_type, :stdout, :stderr, :status
    attr_accessor :width, :height, :timeout

    def display
      @stdout, @stderr, @status = Open3.capture3(to_cmd)
    end

    def to_cmd
      "zenity --#{type} #{all_opts}"
    end

    protected

    def type
      self.class
          .name
          .split('::')
          .last
          .downcase
    end

    def all_opts
      unless dialog_opts.is_a? Hash
        raise 'Method `dialog_opts` should return a Hash.'
      end

      dialog_opts
        .merge(general_opts)
        .map { |opt, val| %(--#{opt.to_s}="#{val}") }
        .join ' '
    end

    def dialog_opts
      raise NotImplementedError
    end

    def general_opts
      { width: @width,
        height: @height,
        timeout: @timeout
      }.filter { |_, v| !!v }
    end
  end
end
