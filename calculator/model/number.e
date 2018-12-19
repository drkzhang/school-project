note
  description: "Objects that describe calculator numbers"
  author: "G.J. Gotshalks"
  date: "2013 January 7"
  revision: "V1.0"

class NUMBER
  inherit PROGRAM_ITEM

create make

--------------------------------------------------------------------------------
feature -- Objects

value: REAL

--------------------------------------------------------------------------------
feature {NONE} -- Creation

make(number: STRING)
    -- Create a number.
  do
    if number.is_equal ("3.14159") then text := "pi"
    elseif number.is_equal ("-3.14159") then text := "-pi"
    else text := number
    end
    value := number.to_real
  end
feature
describe : STRING

  do
  	Result:= Current.text
  end

accept(visitor : VISITOR; ps : ARRAYED_STACK[PROGRAM_ITEM]) : REAL
do
	Result := visitor.visit_number(Current)
end

end
