module Insatsu
  module Entities
    class Chapter
      attr_reader :title, :paragraphs
      # List of Paragraps and Images
      def initialize(title:, paragraphs: [])
        @title = title
        @paragraphs = paragraphs
      end
    end
  end
end
