require 'insatsu'

paragraphs = [Insatsu::Entities::Paragraph.new(text: '123123')]
chapters = [Insatsu::Entities::Chapter.new(title: '123', paragraphs: paragraphs)]
book = Insatsu::Entities::Book.new(title: 'test_book', chapters: chapters)

xml_book = Insatsu::Parser.new(Insatsu::Formatters::Fb2::PlainXML).call(book)

File.open('test.fb2', 'w') { |f| f.write(xml_book) }
