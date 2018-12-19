note
	description: "Plain text file with get line"
	author: "Gunnar Gotshalks"
	date: "2006 May 15"
	version: "1.0"

--==============================================================================
-- Copyright (c) Gunnar Gotshalks. All Rights Reserved.
--
-- Permission to use, copy, modify, and distribute this software and its
-- documentation for NON-COMMERCIAL purposes and without fee is hereby granted.
--==============================================================================

class	TEXT_FILE
  inherit PLAIN_TEXT_FILE redefine make_open_read, make_open_write end

create make_open_read, make_open_write

--------------------------------------------------------------------------------
feature -- Hidden attributes

file_count : INTEGER         -- File size in bytes
read_char_count : INTEGER    -- Number of times get_character is called
ctrl : CONTROL_CHAR          -- Use some control characters

	-- Delete character would not be in a text file line
line_does_not_exist: STRING = "123"

--------------------------------------------------------------------------------
feature -- Attributes

last_line : STRING           -- Line characters read by last get_line
                             -- does not include EOL

--------------------------------------------------------------------------------
feature {NONE} -- Creation

make_open_read(filename : STRING)
  -- Open file and make the control characters available
  do
    Precursor(filename)
    create ctrl
    last_line := line_does_not_exist
    file_count := count
    if off then
      read_char_count := 1
      last_character := ctrl.EOF
    else get_character
    end
    ensure then
      size_set: file_count = count
      char_count: read_char_count = 1
  end

make_open_write(filename : STRING)
  -- Open file and make the control characters available
  do
    Precursor(filename)
    create ctrl
    last_line := line_does_not_exist
  end

--------------------------------------------------------------------------------
feature -- Read

get_character
  -- Read one character unless at end of file.  Count the reads.
  require True
  do
    if last_character /= ctrl.EOF then
      read_character
      read_char_count := read_char_count + 1
      if after then last_character := ctrl.EOF end
    end
    ensure
      before_eof: old last_character /= ctrl.EOF and last_character /= ctrl.EOF
        implies read_char_count = old read_char_count + 1
      at_eof: old last_character /= ctrl.EOF and last_character = ctrl.EOF
        implies read_char_count = old read_char_count + 1
      after_eof: old last_character = ctrl.EOF
        implies read_char_count = old read_char_count
  end

get_line
  -- Read and save characters from the last_character until EOL
  require read_char_count > 0  -- have read at least the first character
  do
    if last_character /= ctrl.EOF then
      last_line := ""
      from
--      invariant (not after and read_char_count = position)
--             or (after and read_char_count = position + 1)
      until last_character = ctrl.EOL or last_character = ctrl.EOF
      loop
        last_line.extend(last_character)
        get_character
      variant file_count - read_char_count + 1
      end
      get_character
    else
    last_line := line_does_not_exist
    end
    ensure
      before_eof:
        last_character /= ctrl.EOF implies last_line /= line_does_not_exist
      at_eof:
        old last_character /= ctrl.EOF and last_character = ctrl.EOF implies
            last_line /= line_does_not_exist
      after_eof:
        old last_character = ctrl.EOF implies last_line = line_does_not_exist
  end

end
