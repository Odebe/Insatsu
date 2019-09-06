module Insatsu
  module Entities
    class Book
      attr_reader :title, :chapters
      
      def initialize(title:, chapters: [])
        @title = title
        @chapters = chapters
      end

      def images
        []
      end
    end    
  end
end
