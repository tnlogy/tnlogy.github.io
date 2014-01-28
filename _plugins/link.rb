module Jekyll
  class Link < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @title, @link = text.split(":")	
    end

    def render(context)
      "#{@title}<a href='#{@link}'><img style='margin-left:5px;height:14px;' src='http://lua.org/favicon.ico'/></a>"
    end
  end
end

Liquid::Template.register_tag('link', Jekyll::Link)