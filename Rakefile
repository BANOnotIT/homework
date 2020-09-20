# frozen_string_literal: true

require_relative 'settings.rb'
require 'asciidoctor'
require 'asciidoctor-pdf'
require 'asciidoctor-diagram'
require 'logger'
require 'rake/clean'

# @param [String] str
def secure_latex(str)
  str.gsub('\\', '\\\\')
     .gsub('{', '\\{')
     .gsub('}', '\\}')
end

# @return [String (frozen)]
# @param [Hash] props
def generate_title(props)
  %(
  \\documentclass{labreport}

\\title{#{secure_latex props[:title]}}
\\author{#{secure_latex props[:author]}}
\\group{#{secure_latex props[:group_ref]}}
\\labRef{#{secure_latex props[:lab_ref]}}
\\discipline{#{secure_latex props[:discipline]}}

\\begin{document}
  \\maketitle
\\end{document}
)
end

task :report do
  call_dir = Rake.original_dir
  root_dir = Dir.pwd

  Dir.chdir call_dir
  puts "[.] Reading #{call_dir + '/README.adoc'} ..."

  # https://asciidoctor.org/docs/user-manual/#ruby-api-options
  prog_attributes = [
    'notitle',
    'lang=ru',
    "pdf-theme=#{__dir__ + '/adoc_styles/my-theme.yml'}",
    'source-highlighter=rouge'
  ]
  adoc = Asciidoctor.convert_file 'README.adoc', safe: :safe, backend: :pdf, attributes: prog_attributes
  mv 'README.pdf', 'content.pdf'

  vars = {
    title: adoc.title,
    author: adoc.attr('author', AUTHOR),
    lab_ref: adoc.attr('lab', '1'),
    group_ref: adoc.attr('group-ref', GROUP),
    discipline: adoc.attr('discipline', DISCIPLINE)
  }
  Dir.chdir root_dir + '/latex'

  File.write 'title.tex', generate_title(vars)
  sh 'pdflatex title.tex'
  mv 'title.pdf', call_dir

  rm FileList['*.tex', '*.log', '*.aux']

  Dir.chdir call_dir

  sh 'gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=README.pdf title.pdf content.pdf'
end

task default: [:report]
