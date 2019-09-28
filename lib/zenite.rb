# frozen_string_literal: true

require 'zenite/version'
require 'zenite/option'
require 'zenite/dialog'
require 'zenite/question'

module Zenite
  class Error < StandardError; end
  class InvalidArgumentException < RuntimeError; end
end
