note
	description: "ASCII control character definitions"
	author: "Gunnar Gotshalks"
	date: "2006 May 15"
	version: "1.0"
 
--==============================================================================
-- Copyright (c) Gunnar Gotshalks. All Rights Reserved.
-- 
-- Permission to use, copy, modify, and distribute this software and its
-- documentation for NON-COMMERCIAL purposes and without fee is hereby granted. 
--==============================================================================
-- The class names the control characters because it is inconvenient to
-- try to remember their ordinal position in the ASCII character set.  The names
-- are the standard ASCII abbreviation.  We also give aliases to match common
-- usage for some of the characters.  All the other characters are easily
-- represented within quotes and easy to remember and understand, so no special
-- names are given to them -- except for Space which is ubiquitous and not
-- always easy to see.
--==============================================================================

class	CONTROL_CHAR

--------------------------------------------------------------------------------
feature -- Exported attributes

NUL   : CHARACTER ='%/00/' -- Null
SOH   : CHARACTER ='%/01/' -- Start of heading
STX   : CHARACTER ='%/02/' -- Start of text
ETX   : CHARACTER ='%/03/' -- End of text
EOT   : CHARACTER ='%/04/' -- End of transmission
ENQ   : CHARACTER ='%/05/' -- Enquire
ACK   : CHARACTER ='%/06/' -- Acknowledge
BEL   : CHARACTER ='%/07/' -- Ring the bell
BS    : CHARACTER ='%/08/' -- Backspace
HT    : CHARACTER ='%/09/' -- Horizontal tab
LF    : CHARACTER ='%/10/' -- Line feed
EOL   : CHARACTER ='%N'    -- End of line
VT    : CHARACTER ='%/11/' -- Vertical tab
FF    : CHARACTER ='%/12/' -- Form feed
CR    : CHARACTER ='%/13/' -- Carriage return
SO    : CHARACTER ='%/14/' -- Shift out -- change character sets
SI    : CHARACTER ='%/15/' -- Shift in -- change character sets
TD    : CHARACTER ='%/15/' -- Toggle transmission to display screen
DLE   : CHARACTER ='%/16/' -- Data link escape
DC1   : CHARACTER ='%/17/' -- Device control 1
XON   : CHARACTER ='%/17/' -- Resume transmission to the screen and resume work
DC2   : CHARACTER ='%/18/' -- Device control 2
DC3   : CHARACTER ='%/19/' -- Device control 3
XOFF  : CHARACTER ='%/19/' -- Stop transmission to screen and stop work
DC4   : CHARACTER ='%/20/' -- Device control 4
NAK   : CHARACTER ='%/21/' -- Negative acknowledge
SYN   : CHARACTER ='%/22/' -- Synchronize idle
ETB   : CHARACTER ='%/23/' -- End of transmission block
CAN   : CHARACTER ='%/24/' -- Cancel
EM    : CHARACTER ='%/25/' -- End of medium
ABORT : CHARACTER ='%/25/' -- Interrupt the program
SUB   : CHARACTER ='%/26/' -- Substitute
EOF   : CHARACTER ='%/26/' -- End of file
ESC   : CHARACTER ='%/27/' -- Escape
FX    : CHARACTER ='%/28/' -- Field separator
GX    : CHARACTER ='%/29/' -- Group separator
RS    : CHARACTER ='%/30/' -- Record separator
US    : CHARACTER ='%/31/' -- Unit separator
DEL   : CHARACTER ='%/127/' -- Delete last character

end
