require "iso_tex_2_utf8_tex"

Given(/^a transformer$/) do
  @transformer = IsoTex2Utf8Tex::Transformer.new()
end

Then(/^it replaces the Latex escape sequence with the appropriate utf8_char :$/) do |table|
  escaped_seqs = [["escape","utf8_char"]]
  table.hashes.each do |h|
    escaped = @transformer.replace_tex_escapes(h[:escape])
    escaped_seqs << [ h[:escape], escaped]
  end
     
  table.diff!(escaped_seqs )
end

Then(/^it leaves other charcers that might be escape sequences be :$/) do |table|
  data = [["given","expected"]]
  table.hashes.each do |h|
    generated = @transformer.replace_tex_escapes(h[:given])
    data << [ h[:given], generated]
  end
  
  table.diff!(data)
end 


When(/^it gets latex code with specific package imports like "(.*?)"$/) do |input|
  @package_transform_result = @transformer.latin1_package_to_utf8(input)
end

Then(/^it replaces these imports with "(.*?)"$/) do |expected_output|
  @package_transform_result == expected_output
end

Then(/^it replaces documentclass with "(.*?)"$/) do |expected|
  @transformer.improve_layout('\documentclass[a4paper,10pt,notitlepage]{article}') == expected
end

