require 'nokogiri'
require 'pp'
require 'punkt-segmenter'

important_settings = File.read(File.expand_path('./for_use_puppet-documentation_important-settings-replace-p-with-div-and-phtml_ja_JP.html'), encoding: 'utf-8')
parsed = Nokogiri::HTML::DocumentFragment.parse(important_settings)

all_sentences = parsed.css('p.temp-sentence')
all_real_paragraphs = parsed.css('div.real-paragraph')

all_sentences.each do |sentence|
  sentence.replace(sentence.inner_html)
end

all_real_paragraphs.each do |graf|
  graf.replace( '<p>' << graf.inner_html << '</p>' )
end

print parsed.to_html
