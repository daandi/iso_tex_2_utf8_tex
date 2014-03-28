require 'iso_tex_2_utf8_tex/version'

module IsoTex2Utf8Tex
  
  class Transformer
    
    @@mapping = {
      "\"A" => "Ä",
      "\"O" => "Ö",
      "\"U" => "Ü",
      "\"a" => "ä",
      "\"o" => "ö",
      "\"u" => "ü",
      "ss" => "ß"
    }
    
    def transcode_file(f)
      source_file = File.new(f,"r",:encoding => 'iso-8859-1')
      text = source_file.read()
      # Text von iso-8559-1 (Latin1) zu Utf-8 konvertieren
      improve_layout(
        replace_tex_escapes(
          latin1_package_to_utf8(
            text.encode(Encoding::UTF_8 ) ) ) )
    end
  
    def improve_layout(text)
        #komascipt for nicer layout
        text.sub(/documentclass[^}]+\}/,"documentclass[a4paper,11pt,notitlepage]{scrartcl}")
    end
    
    def latin1_package_to_utf8(text)
        # Latex encoding ändern
        text.sub("usepackage[latin1]{inputenc}","usepackage[utf8]{inputenc}")
    end
    
    def replace_tex_escapes(text)
      text.gsub(/\{?\\(ss|"[AOUaou])\}?/ ) { |escape| @@mapping[$1] }
    end
  end
  
end
