note
	description: "Root class for Mildred-Mordred file merge"
	author: "Gunnar Gotshalks"
	date: "2006 May 15"
	version: "1.0"

--==============================================================================
-- Copyright (c) Gunnar Gotshalks. All Rights Reserved.
--
-- Permission to use, copy, modify, and distribute this software and its
-- documentation for NON-COMMERCIAL purposes and without fee is hereby granted.
--==============================================================================

class MILDRED_MORDRED inherit CONTROL_CHAR
  create make

--------------------------------------------------------------------------------
feature -- Attributes

mildred: TEXT_FILE   -- File to read Mildred lines
mordred: TEXT_FILE   -- File to read Mordred lines
mil_mor: TEXT_FILE   -- File to write merged result

MaxColumnWidth: INTEGER = 10        -- The maxuimum of a dialogue column
ColumnSpace : Integer = 4           -- The space count between the columns
ColumnSpaceString: STRING = "    "  -- The space between the columns
MinDashCount: INTEGER = 6           -- Minimum number of dashes in a dash line
MinDashString: STRING = "------"    -- Minimum sized dashed line
MaxColumnString: STRING = "          " -- The maxuimum space of a dialogue column
--------------------------------------------------------------------------------
feature {NONE} -- Creation

make
  do
    create mildred.make_open_read("mildred_1.text")
    create mordred.make_open_read("mordred_1.text")
    create mil_mor.make_open_write("play.text")
    merge_mildred_and_mordred
    mildred.close ; mordred.close ; mil_mor.close
  end

--------------------------------------------------------------------------------
feature {NONE} -- Merge

merge_mildred_and_mordred
  do

from mildred.get_line
 mordred.get_line

until mildred.last_line = mildred.line_does_not_exist or mordred.last_line = mordred.line_does_not_exist --process mildred and mordred file until one of them
             																							 -- reaches end of file
loop
if not is_min_dash(mildred) and not is_min_dash(mordred) then  --both lines are not dash-lines.
	mil_mor.putstring (mildred.last_line)
	add_space(mildred)
	mil_mor.putstring (ColumnSpaceString)
	mil_mor.putstring (mordred.last_line)
	add_space(mordred)
	mil_mor.putchar (EOL)
    mildred.get_line
	mordred.get_line

elseif is_min_dash(mildred) and not is_min_dash(mordred) then -- mildred line is dash-line, mordred line is not.
	print_mordred_line_until_dash
	 mildred.get_line
	mordred.get_line
	elseif not is_min_dash(mildred) and is_min_dash(mordred) then -- mordred line is dash-line, mildred line is not.
	print_mildred_line_until_dash
	 mildred.get_line
	mordred.get_line
	else --both lines are dash-lines, ignore and proceed to next line.

		mildred.get_line
		mordred.get_line

end

end
if  mildred.last_line /= mildred.line_does_not_exist then --process remaining mildred lines after mordred file reaches the end.
	from

	until mildred.last_line = mildred.line_does_not_exist

	loop

		mil_mor.putstring (mildred.last_line)
		add_space(mildred)
		mil_mor.putstring (ColumnSpaceString)
		mil_mor.putstring (MaxColumnString)
		mil_mor.putchar (EOL)
	    mildred.get_line
	end

end
if  mordred.last_line /= mordred.line_does_not_exist then --process remaining mordred lines after mildred file reaches the end.
	from

	until mordred.last_line = mordred.line_does_not_exist

	loop

		mil_mor.putstring (MaxColumnString)
		mil_mor.putstring (ColumnSpaceString)
		mil_mor.putstring (mordred.last_line)
		add_space(mordred)
		mil_mor.putchar (EOL)
	    mordred.get_line
	end
end


end


add_space(input:TEXT_FILE) --add space for input line such that length of input line equals MaxColumnWidth.
require
	input_not_void: input /= void
local
	i: INTEGER
	j: INTEGER
	k: INTEGER
do
	j:=input.last_line.count

	if j < MaxColumnWidth then
		i:= MaxColumnWidth - j

	end
	from k:=1

	until k > i

	loop

		mil_mor.putchar (' ')
		k:= k + 1
	end

end


is_min_dash(input:TEXT_FILE):BOOLEAN -- check if an input line is a dash-line.
require
	input_not_void: input /= void
do
	if input.last_line.count /= 0 and input.last_line.item (1) = '-' and input.last_line.count >= MinDashCount then
	Result := TRUE
	else
		Result := FALSE
	end

end
print_mildred_line_until_dash --  output lines in mildred file after a dash-line is encountered in mordred file until a dash-line is also encountered in mildred file.
require
	mordred_is_min_dash: is_min_dash(mordred)
do
	from

	until is_min_dash(mildred) or mildred.last_line = mildred.line_does_not_exist

	loop
		mil_mor.putstring (mildred.last_line)
		add_space(mildred)
	    mil_mor.putstring (ColumnSpaceString)
	    mil_mor.putstring (MaxColumnString)
		mil_mor.putchar (EOL)
	    mildred.get_line

	end
end
print_mordred_line_until_dash ----  output lines in mordred file after a dash-line is encountered in mildred file until a dash-line is also encountered in mordred file.
require
	moilred_is_min_dash: is_min_dash(mildred)
do
	from

	until is_min_dash(mordred) or mordred.last_line = mordred.line_does_not_exist

	loop
		mil_mor.putstring (MaxColumnString)
		mil_mor.putstring (ColumnSpaceString)
		mil_mor.putstring(mordred.last_line)
		add_space(mordred)
		mil_mor.putchar (EOL)
	    mordred.get_line

	end
end

--------------------------------------------------------------------------------
invariant
  correct_column_space_constants: ColumnSpace = ColumnSpaceString.count
  correct_dash_string_constants: MinDashCount = MinDashString.count
  correct_max_column_string_constants: MaxColumnWidth = MaxColumnString.count
end
