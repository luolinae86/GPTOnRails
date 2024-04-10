# frozen_string_literal: true

class HTMLwithCoderay < Redcarpet::Render::HTML
  def block_code(code, language)
    language = language.split(':')[0] if language.present?

    lang = case language.to_s
           when 'rb'
             :ruby
           when 'yml'
             :yaml
           when 'css'
             :css
           when 'html'
             :html
           when ''
             :md
           else
             language
           end

    CodeRay.scan(code, lang).div
  end
end

module MarkdownHelper
  def markdown_to_html(text)
    # renderer = Redcarpet::Render::HTML.new
    # markdown = Redcarpet::Markdown.new(renderer)
    # markdown.render(text).html_safe
    renderer = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    markdown.render(text).html_safe
  end
end
