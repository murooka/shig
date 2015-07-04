require 'shig/version'
require 'shig/web'

module Shig

  module Context

    attr_accessor :context

    def context_txn(c)
      orig = self.context
      self.context = c
      res = yield
      self.context = orig

      res
    end

  end

  def self.included(klass)
    klass.extend Context
  end

  def call(env)
    klass = Module.const_get("#{self.class}::Web")
    ctx = klass.new(env: env)
    self.class.context_txn(ctx) do
      res = ctx.dispatch
      res.finish
    end
  end

end
