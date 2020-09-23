# frozen_string_literal: true

# @param [String] word
def transform_word(word)
  word = word.gsub(/[еоё]нок$/, '')

  word + (word.match?(/[шщжч]$/i) ? 'ата' : 'ята')
end
