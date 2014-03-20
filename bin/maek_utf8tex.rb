#!/usr/bin/env ruby

require "iso_tex_2_utf8_tex"

filename = ARGV[0]
new_file_name = filename.sub(".tex","_utf_8.tex")
File.open(new_file_name, "w+", :encoding => 'utf-8' ).write( ISOTex2UTF8Tex.new(filename).transcode )
puts "UTF-8 Encoded tex file written to #{new_file_name}"