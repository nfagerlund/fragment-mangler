require 'nokogiri'
require 'pp'
require 'punkt-segmenter'

important_settings = File.read('/Users/nick/Documents/puppet-docs/output/puppet/4.2/reference/config_important_settings.html', encoding: 'utf-8')
parsed = Nokogiri::HTML::DocumentFragment.parse(important_settings)
tokenizer = Punkt::SentenceTokenizer.new(important_settings)

all_paragraphs = parsed.css('p')


all_paragraphs.each do |graf|
  graf.inner_html = tokenizer.sentences_from_text(graf.inner_html, :output => :sentences_text).join(' </p><p class="temporary"> ')
end

print parsed.to_html

