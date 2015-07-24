require 'nokogiri'

def unsegment_paragraphs(text)
  parsed = Nokogiri::HTML::DocumentFragment.parse(text)

  all_sentences = parsed.css('p.temp-sentence')
  all_real_paragraphs = parsed.css('div.real-paragraph')

  # break internal bubbles
  all_sentences.each do |sentence|
    sentence.replace(sentence.inner_html)
  end

  # transform into paragraph
  all_real_paragraphs.each do |graf|
    graf.replace( '<p>' << graf.inner_html << '</p>' )
  end

  parsed.to_html
end

important_settings = File.read(File.expand_path('./for_use_puppet-documentation_important-settings-replace-p-with-div-and-phtml_ja_JP.html'), encoding: 'utf-8')


print unsegment_paragraphs(important_settings)
