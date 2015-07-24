require 'nokogiri'
require 'punkt-segmenter'

@tokenizer = nil

def call_punkt_segmenter(text)
  @tokenizer.sentences_from_text(text, :output => :sentences_text)
end

def segment_on_sentences(text)
  parsed = Nokogiri::HTML::DocumentFragment.parse(text)
  @tokenizer = Punkt::SentenceTokenizer.new(text)

  all_paragraphs = parsed.css('p')

  all_paragraphs.each do |graf|
    sentences = call_punkt_segmenter(graf.inner_html)
    new_div = '<div class="real-paragraph"> <p class="temp-sentence">' << sentences.join('</p> <p class="temp-sentence">') << '</p></div>'
    graf.replace(new_div)
  end

  parsed.to_html
end

important_settings = File.read(File.expand_path('./config_important_settings.html'), encoding: 'utf-8')


print segment_on_sentences(important_settings)

