#!/usr/bin/env ruby

require 'iso_tex_2_utf8_tex'

def recode_file(in_file , out_file)
  transformer = IsoTex2Utf8Tex::Transformer.new
  File.open(out_file, "w+", :encoding => 'utf-8' ).write( transformer.transcode_file(in_file) )
  puts "UTF-8 Encoded tex file written to #{out_file}"
end

case ARGV.size
  when 1 then recode_file(ARGV[0], ARGV[0].sub(".tex","_utf_8.tex")  )
  when 2 then recode_file(ARGV[0], ARGV[1])
  else 
    puts <<-eos
         Usage: 
           iso_tex_2_utf8 <INPUT_FILE> <OUTPUT_FILE> : Latin1 input file will be recoded and written to utf8 output file
           iso_tex_2_utf8 <INPUT_FILE> : Latin1 input file will be recoded and written to utf8 output file, which will be named like the input file with _utf8 attached"
         eos
end


