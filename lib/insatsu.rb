require './insantsu/**/*'

module Insatsu
  VERSION = '0.0.1'
end

# book = Insatsu::Book.new(chapters: [Insatsu::Chapter.new(paragraphs: [Insatsu::Paragraph.new('')])])
# 
xml_str = Insatsu::Formatter::Fb2::PlainXML.new(book: book).to_xml
# File.open('test.fb2', 'w') { |f| f.write(xml_str) }

# Insatsu::Formatter::Fb2::PlainXML.new(book).save('test2.fb2')
