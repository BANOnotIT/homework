# frozen_string_literal: true

# @param [String] word
def transform_word(word)
  word = word.gsub(/[еоё]нок$/, '')

  word.match?(/[шщжч]$/i) ? word + 'ата' : word + 'ята'
end
