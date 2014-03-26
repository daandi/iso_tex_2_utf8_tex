Feature: Transformer
	Scenario: Transform Latex Escape Sequences to utf-8
	  Given a transformer
	  Then it replaces the Latex escape sequence with the appropriate utf8_char :
		|  escape  | utf8_char |
	    |  \"u     | ü         |
	    |  \"O     | Ö         |
		|  \ss     | ß         |
		|  {\ss}   | ß         |
		|  {\"a}   | ä         |

	Scenario: Replace latin1 specific package imports 
		Given a transformer
		When it gets latex code with specific package imports like "\\usepackage[latin1]{inputenc}"
		Then it replaces these imports with "\\usepackage[utf8]{inputenc}"
		
	Scenario: Replace standard documentclass with Koma Script
		Given a transformer
		Then it replaces documentclass with "documentclass[a4paper,11pt,notitlepage]{scrartcl}"