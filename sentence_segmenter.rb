require 'nokogiri'
require 'punkt-segmenter'

def segment_on_sentences(text)
  parsed = Nokogiri::HTML::DocumentFragment.parse(text)
  tokenizer = Punkt::SentenceTokenizer.new(text)

  all_paragraphs = parsed.css('p')

  all_paragraphs.each do |graf|
    sentences = tokenizer.sentences_from_text(graf.inner_html, :output => :sentences_text)
    new_div = '<div class="real-paragraph"> <p class="temp-sentence">' << sentences.join('</p> <p class="temp-sentence">') << '</p></div>'
    graf.replace(new_div)
  end

  parsed.to_html
end

important_settings = File.read(File.expand_path('./config_important_settings.html'), encoding: 'utf-8')


print segment_on_sentences(important_settings)

