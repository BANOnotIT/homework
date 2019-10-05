require 'rouge' unless defined? ::Rouge.version

module Rouge; module Themes
  class Custom < CSSTheme
    name 'custom'

    style Comment,           fg: '#999', italic: true
    style Str,               fg: '#111'
    style Str::Char,         fg: '#800080'
    style Num,               bold: true
    style Keyword,           bold: true
    style Operator::Word,    bold: true
    # style Name::Tag,         fg: '#000080', bold: true
    # style Name::Attribute,   fg: '#ff0000'
    style Generic::Deleted,  fg: '#000', bg: '#ffdddd', inline_block: true, extend: true
    style Generic::Inserted, fg: '#000', bg: '#ddffdd', inline_block: true, extend: true
    style Text, {}
  end
end; end