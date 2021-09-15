module Jekyll
 require "nokogiri"
 class MyGenerator < Jekyll::Generator
  safe true
    def generate(site)
        parser = Jekyll::Converters::Markdown.new(site.config)
        listDoc = nil
        todos = []
        #puts devDocs.length
        site.collections.each do |collection|
            currDocs = collection[1].docs
            currDocs.each do |doc|
                if doc.id == '/dev/todo'
                     listDoc = doc
                 end
                parsed = Nokogiri::HTML(parser.convert(doc.content))
                divs = parsed.css('.todo')

                if divs.length > 0
                    val = [doc, divs.map { |div| div.serialize}]
                    todos << val
                end
            end
        end
        listDoc.data['todos'] = todos
    end
  end
end


