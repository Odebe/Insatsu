module Insatsu
  module Entities
    class Paragraph
      attr_reader :text

      def initialize(text: '')
        @text = text
      end
    end
  end
end
