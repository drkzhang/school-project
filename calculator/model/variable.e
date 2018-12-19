note
  description: "Objects that describe calculator variables"
  author: "G.J. Gotshalks"
  date: "2013 January 7"
  revision: "V1.0"

class VARIABLE
  inherit PROGRAM_ITEM

create make

--------------------------------------------------------------------------------
feature {NONE} -- Creation

make (variable: STRING)
    -- Create a variable.
  do
    text := variable
  end
feature
describe : STRING

  do
  	Result:= Current.text
  end

accept(visitor : VISITOR; ps : ARRAYED_STACK[PROGRAM_ITEM]) : REAL
do
	Result := visitor.visit_variable(Current)
end

end
