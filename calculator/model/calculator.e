note
  description: "Objects that describe calculators"
  author: "Jingmian Zhang"
  date: "2016.12.4"
  revision: "V1.0"

class CALCULATOR

create make
--==============================================================================
-- Do not change anything above this comment, except for the author and date.
--==============================================================================
--------------------------------------------------------------------------------
feature {NONE} -- Constants

--------------------------------------------------------------------------------
feature -- Objects

program: ARRAYED_STACK[PROGRAM_ITEM]
doubleMath: DOUBLE_MATH
xValueToUse: REAL

--------------------------------------------------------------------------------
feature {NONE} -- Creation

make
    -- Create a calculator.
  do
    create program.make(100)
    create doubleMath

  end

--------------------------------------------------------------------------------
feature -- Button actions

pushOperand(operand: STRING)
  do
    program.extend(create {NUMBER}.make(operand))
  end

pushVariable(variable: STRING)
  do
    program.extend(create {VARIABLE}.make(variable))
  end

clear
    -- Reset to starting conditions
  do
    program.wipe_out
  end

undo
    -- Remove the last item from the program
  do
    if program.count > 0 then program.remove end
  end

performOperation(operation: STRING) : REAL
  do
    program.extend(create {OPERATOR}.make(operation))
    Result := runProgram
  end

--------------------------------------------------------------------------------
feature -- Evaluation

runProgram : REAL
  local
    ps: ARRAYED_STACK[PROGRAM_ITEM]
  do
    ps := program.twin
    Result := popOperandOffProgramStack(ps)
  end

runProgramWithXvalue(xValue: REAL) : REAL
  do
    xValueTOUse := xValue
    Result := runProgram
  end

popOperandOffProgramStack (ps : ARRAYED_STACK[PROGRAM_ITEM]) : REAL
  local
  	concrete_visitor: CONCRETE_VISITOR
    topOfStack: PROGRAM_ITEM
  do
    if not ps.is_empty then
      topOfStack := ps.item
      ps.remove
      create concrete_visitor.make
      Result:= topOfStack.accept (concrete_visitor, ps)
    end
  end

--------------------------------------------------------------------------------
feature -- Description

descriptionOfProgram : STRING
  local
    ps: ARRAYED_STACK[PROGRAM_ITEM]
  do
    Result := ""
    if not program.is_empty then
      ps := program.twin
        -- First item is special to set initial value of Result
     Result:= ps.item.describe
      ps.remove

      from     -- Can loop over the rest of the program items
      until ps.is_empty
      loop
       Result:= ps.item.describe + " " + Result
        ps.remove
      end
    end
  end

end
