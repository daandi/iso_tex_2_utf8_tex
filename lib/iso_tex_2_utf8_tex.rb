require 'iso_tex_2_utf8_tex/version'
require 'latex/decode'

module IsoTex2Utf8Tex
  
  class Transformer
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
      LaTeX.decode(text)
    end
  end
  
end
