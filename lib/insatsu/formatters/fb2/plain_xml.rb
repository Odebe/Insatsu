module Insatsu
  module Formatters
    module Fb2
      class PlainXML
        def initialize(book)
          @book = book
        end

        # TODO: refactor this peace of code later. lol
        def call
          %Q(
            <?xml version="1.0" encoding="UTF-8"?>
            <FictionBook xmlns="http://www.gribuser.ru/xml/fictionbook/2.0" xmlns:l="http://www.w3.org/1999/xlink">
              <description>
                <title-info>
                  <book-title>#{title}</book-title>
                  <coverpage>#{coverpage}</coverpage>
                </title-info>
              </description>
               <body>
                #{ xml_title(title) }
                #{ xml_sections_str }
                #{ xml_binary_data }
              </body>
            </FictionBook>
          )
        end

        private

        def xml_sections_str
          sections.map do |section|
            %Q(
              <section>
                #{ xml_title(section.title) }
                #{ xml_paragraphs_str(section.paragraphs) }
              </section>
            )
          end.join('')
        end

        def xml_paragraphs_str(pars)
          puts pars.inspect
          pars.map do |par|
            if par.is_a? Insatsu::Entities::Paragraph
              xml_text(par.text)
            elsif par.is_a? Insatsu::Entities::Image
              xml_image_href(par.filename)
            else
              ''
            end
          end.join("\n")
        end

        def xml_binary_data
          images.map do |image|
            # Binary is image in base64.
            "<binary id=\"#{image.filename}\" content-type=\"image/jpeg\">#{image.base64}</binary>"
          end.join('')
        end

        def xml_image_href(filename)
          "<image l:href=\"\##{filename}\"/>"
        end

        def xml_text(text)
          "<p>#{text}</p>"
        end

        def xml_title(title)
          "<title>#{xml_text(title)}</title>"
        end

        def sections
          @book.chapters
        end

        def title
          @book.title
        end

        def coverpage
          @book.images.first
        end

        def images
          @book.images
        end
      end
    end
  end  
end
