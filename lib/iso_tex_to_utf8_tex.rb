#!/usr/bin/ruby -w

class ISOTex2UTF8Tex
  
  @@mapping = {
    "\\\"a" => "ä",
    "\\\"u" => "ü",
    "\\\"o" => "ö",
    "\\\"O" => "Ö",
    "\\\"U" => "Ü",
    "\\\"A" => "Ä",
    "\\\{ss}"=> "ß"  
  }
  @source_file
   
  def initialize(f)
    @source_file = File.new(f,"r",:encoding => 'iso-8859-1')
  end
  
  def transcode
    text = @source_file.read()
    # Text in von iso-8559-1 (Latin1) zu Utf-8 konvertieren
    improve_layout( replace_tex_escapes( text.encode(Encoding::UTF_8 ) ) )
  end
  
  def improve_layout(text)
      #komascipt for nicer layout
      text.sub(/documentclass[^}]+\}/,"documentclass[a4paper,11pt,notitlepage]{scrartcl}")
  end
  
  def replace_tex_escapes(text)
    # Latex encoding ändern
    text.sub!("usepackage[latin1]{inputenc}","usepackage[utf8]{inputenc}")
    # Latex-Escapes in UTF-8 umsetzen, Mapping kann oben erweitert werden
    @@mapping.each do |latex_encoding,utf_8_char|
      text.gsub!(latex_encoding,utf_8_char)
    end
    text
  end
end