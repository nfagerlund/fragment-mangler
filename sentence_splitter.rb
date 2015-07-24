require 'nokogiri'
require 'pp'
require 'punkt-segmenter'

important_settings = File.read(File.expand_path('./config_important_settings.html'), encoding: 'utf-8')
parsed = Nokogiri::HTML::DocumentFragment.parse(important_settings)
tokenizer = Punkt::SentenceTokenizer.new(important_settings)

all_paragraphs = parsed.css('p')


all_paragraphs.each do |graf|
  sentences = tokenizer.sentences_from_text(graf.inner_html, :output => :sentences_text)
  new_div = '<div class="real-paragraph"> <p class="temp-sentence">' << sentences.join('</p> <p class="temp-sentence">') << '</p></div>'
  graf.replace(new_div)
end

print parsed.to_html

