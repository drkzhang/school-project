note
  description: "Objects that control and are delegates for calculator views."
  author: "G.J. Gotshalks"
  date: "2013 January 7"
  revision: "V1.0"

class CALCULATOR_VIEW_CONTROLLER
  inherit ANY
          redefine default_create end

--==============================================================================
-- Do not change anything above this comment, except for the author and date.
-- This is the MVC_Calculator pattern example with program text rearranged to
-- make it more convenient to make changes as they all occur in the top of the
-- program text, where the controller interacts with the model.
--==============================================================================
--------------------------------------------------------------------------------
feature {CALCULATOR_PAD_VIEW} -- Actions to change

addPressed do operationPressed("+") end
subtractPressed do operationPressed("-") end
multiplyPressed do operationPressed("*") end
dividePressed do operationPressed("/") end

sqrtPressed do operationPressed("sqrt") end
sinPressed do operationPressed("sin") end
cosPressed do operationPressed("cos") end

operationPressed (operation: STRING)
  do
    removePotentialEqualSign
    if   userIsInTheMiddleOfEnteringANumber
      or labelValue.text.is_equal("x")
      or labelValue.text.is_equal("-x") then enterPressed
    end
    labelValue.set_text (calculator.performOperation(operation).out)
    labelFunction.set_text (calculator.descriptionOfProgram + " =")
  end

--==============================================================================
-- Do not change anything following this comment. Everything in the following
-- deals with the view and not the interaction of the controller with the model.
--==============================================================================
--------------------------------------------------------------------------------
feature {CALCULATOR_PAD_VIEW, FUNCTION_GRAPH_VC} -- Segue

graphPressed
    -- Replace current window with a graph window.  It should be a different
    -- view controller
  local
    graphVC: FUNCTION_GRAPH_VC
  do
    create graphVC.make(verticalBox, Current, Current)
  end

returnFromGraphVC
    -- The "back" button in the graph view invokes this function
  do
    verticalBox.wipe_out
    createPadView

      -- Because new labels are created, it is necessary to set the
      -- values based on the current state of the calculator

    labelValue.set_text (calculator.runProgram.out)
    labelFunction.set_text (calculator.descriptionOfProgram + " =")
  end

--------------------------------------------------------------------------------
feature {APPLICATION} -- Application objects

-- Widget containing the calculator view.

widget: EV_WIDGET

--------------------------------------------------------------------------------
feature {NONE} -- Private objects

verticalBox: EV_VERTICAL_BOX  -- The contents of the widget

labelFunction: EV_TEXT
labelValue:EV_LABEL
userIsInTheMiddleOfEnteringANumber: BOOLEAN

calculator: CALCULATOR

--------------------------------------------------------------------------------
feature {NONE}-- Private constants

initCalculationMsg: STRING -- value obtained from the pad view
math_const: MATH_CONST     -- Need the class for the constant PI
piString: STRING           -- Value of PI as a displayable string
                           -- computed from the math constant

--------------------------------------------------------------------------------
feature {NONE} -- Creation

default_create
    -- Create the controller view and model.
  do
    create verticalBox
    widget := verticalBox
    create calculator.make
  	create math_const
  	initCalculationMsg := ""             -- for void safety
  	piString := math_const.pi.truncated_to_real.out
  	create labelFunction.default_create  -- for void safety
    create labelValue.default_create     -- for void safety
    createPadView
  end

createPadView
    -- The pad view program is put in a separate class for organizational
    -- convenience.  This routine replaces some of the program in default_create
    -- because void safety does not work when calling a support routine
    -- to do initialization that is also used elsewhere (returnFromGraphVC).
  local
    calculator_pad_view: CALCULATOR_PAD_VIEW
  do
    create calculator_pad_view.make(Current, verticalBox)
    widget := verticalBox

      -- Have local names for the labelFunction and labelValue to minimize
      -- the reference length for typing and understanding

    labelFunction := calculator_pad_view.labelfunction
    labelValue := calculator_pad_view.labelvalue
    initCalculationMsg := calculator_pad_view.initcalculationmsg
  end
--------------------------------------------------------------------------------
feature {CALCULATOR_PAD_VIEW} -- Actions

enterPressed
  do
    removePotentialEqualSign
    if userIsInTheMiddleOfEnteringANumber then
      calculator.pushOperand(labelValue.text)
      userIsInTheMiddleOfEnteringANumber := False
    elseif labelValue.text.is_equal ("x")
        or labelValue.text.is_equal ("-x") then
      calculator.pushVariable(labelValue.text)
    else
      calculator.pushOperand(labelValue.text)
    end
    labelFunction.set_text (calculator.descriptionOfProgram)
  end

removePotentialEqualSign
  local
    functionTextEqualPosition: INTEGER
  do
    if labelFunction.text.is_equal (initCalculationMsg) then
      labelFunction.set_text ("")
    end
    if labelFunction.text.count > 0 then
      functionTextEqualPosition := labelFunction.text.count
      if labelFunction.text[functionTextEqualPosition].is_equal('=') then
        labelFunction.set_text (labelFunction.text.substring
                                  (1, functionTextEqualPosition-1))
      end
    end
  end

zeroPressed do digitPressed("0") end
onePressed do digitPressed("1") end
twoPressed do digitPressed("2") end
threePressed do digitPressed("3") end
fourPressed do digitPressed("4") end
fivePressed do digitPressed("5") end
sixPressed do digitPressed("6") end
sevenPressed do digitPressed("7") end
eightPressed do digitPressed("8") end
ninePressed do digitPressed("9") end
periodPressed do digitPressed (".") end

changeSignPressed
  do
    if not labelValue.text.is_equal ("0") then
      if labelValue.text[1] = '-' then
      	labelValue.set_text (labelValue.text.substring (2, labelValue.text.count))
      	if labelValue.text.is_equal (piString) then
      	  calculator.undo
      	  calculator.pushoperand (piString)
      	  labelFunction.set_text (calculator.descriptionOfProgram)
      	end
      else
      	if labelValue.text.is_equal (piString) then
      	  calculator.undo
      	  calculator.pushOperand ("-" + piString)
      	  labelFunction.set_text (calculator.descriptionOfProgram)
      	end
        labelValue.set_text ("-" + labelValue.text)
      end
    end
  end

clearPressed
  do
    labelValue.set_text ("0")
    labelFunction.set_text (initCalculationMsg)
    userIsInTheMiddleOfEnteringANumber := False
    calculator.clear

  end

undoPressed
    -- Remove the last entered digit. If no digit remove the last operation
  local
    cd: STRING
  do
    if userIsInTheMiddleOfEnteringANumber then
      clearLastDigit
    else
      calculator.undo
      labelValue.set_text(calculator.runProgram.out)
      cd := calculator.descriptionOfProgram
      if cd.count = 0 then
        labelFunction.set_text(initCalculationMsg)
      else
        labelFunction.set_text(calculator.descriptionOfProgram + " =")
      end
    end
  end

piPressed
  do
    removePotentialEqualSign
    if   userIsInTheMiddleOfEnteringANumber
      or labelValue.text.is_equal("x")
      or labelValue.text.is_equal("-x") then enterPressed
    end
    labelValue.set_text (piString)
    enterPressed
    labelFunction.set_text(calculator.descriptionOfProgram + " =")
  end

xPressed
  do
    removePotentialEqualSign
    if userIsInTheMiddleOfEnteringANumber
      or labelValue.text.is_equal ("x")
      or labelValue.text.is_equal ("-x") then
      	enterPressed
    end
    labelFunction.set_text(calculator.descriptionofprogram)
    labelValue.set_text ("x")
  end

--------------------------------------------------------------------------------
feature {NONE} -- Support

clearLastDigit
  do
    if userIsInTheMiddleOfEnteringANumber then
      if labelValue.text.count > 1 then
        labelValue.set_text (labelValue.text.substring (1, labelValue.text.count-1))
      else
        labelValue.set_text ("0")
        userIsInTheMiddleOfEnteringANumber := False
      end
    end
  end

digitPressed (digit: STRING)
    -- Append the digit to the displayed number value.
    -- In the view all values are kept as strings.
  do
    if userIsInTheMiddleOfEnteringANumber then
        labelValue.set_text (labelValue.text + digit)
    else
    	removePotentialEqualSign
      userIsInTheMiddleOfEnteringANumber := True
      if digit = "." then
        labelValue.set_text ("0.")
      else
        labelValue.set_text (digit)
      end
    end
  end

--------------------------------------------------------------------------------
feature {FUNCTION_GRAPH_VC} -- Data Source

getYvalueForXvalue(xValue: REAL) : REAL
  do
    Result := calculator.runProgramWithXvalue(xValue)
  end

getFunctionDescription : STRING
  do
    Result := calculator.descriptionofprogram
  end

--------------------------------------------------------------------------------
feature {APPLICATION} -- Initialization

initialize
  do
  end

end
