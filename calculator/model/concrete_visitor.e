note
	description: "Summary description for {CONCRETE_VISITOR}."
	author: "Jingmian Zhang"
 	 date: "2016.12.4"
	revision: "$Revision$"

class
	CONCRETE_VISITOR

inherit
	VISITOR undefine default_create end

	CALCULATOR
create make
--------------------------------------------------------------------------------
feature -- Visitors
visit_number(num: NUMBER) : REAL
do
Result := num.value
end


visit_operator(op: OPERATOR; ps: ARRAYED_STACK[PROGRAM_ITEM]): REAL

do

		if op.text.is_equal("+") then
          Result := popOperandOffProgramStack(ps)
                  + popOperandOffProgramStack(ps)
        elseif op.text.is_equal("*") then
          Result := popOperandOffProgramStack(ps)
                  * popOperandOffProgramStack(ps)
        elseif op.text.is_equal("-") then
          Result := popOperandOffProgramStack(ps)
          Result := popOperandOffProgramStack(ps) - Result
        elseif op.text.is_equal("/") then
          Result := popOperandOffProgramStack(ps)
          Result := popOperandOffProgramStack(ps) / Result
        elseif op.text.is_equal("sin") then
          Result := doubleMath.sine(popOperandOffProgramStack(ps)).truncated_to_real
        elseif op.text.is_equal("cos") then
          Result := doubleMath.cosine(popOperandOffProgramStack(ps)).truncated_to_real
        elseif op.text.is_equal("sqrt") then
          Result := doubleMath.sqrt(popOperandOffProgramStack(ps)).truncated_to_real
        end
end




visit_variable(var: VARIABLE) : REAL
do
 if var.text[1] = '-'  then Result := -(xValueToUse)
                                    else Result := (xValueToUse)
        end
end
end
