module Insatsu
  class Parser
    def initialize(strategy)
      @strategy = strategy
    end

    def call(book)
      @strategy.new(book).call
    end
  end
end
