note
  description: "Summary description for {CALCULATOR_PAD_VIEW}."
  author: "G.J. Gotshalks"
  date: "2016 March 22"
  revision: "V1.0"

class
	CALCULATOR_PAD_VIEW

create make

--------------------------------------------------------------------------------
feature {CALCULATOR_VIEW_CONTROLLER} -- Constants

initCalculationMsg: STRING = "Start new calculation"

--------------------------------------------------------------------------------
feature {NONE} -- Private constants

point_size_18: INTEGER = 18

--------------------------------------------------------------------------------
feature {CALCULATOR_VIEW_CONTROLLER} -- Objects

labelFunction: EV_TEXT
labelValue:EV_LABEL

--------------------------------------------------------------------------------
feature {NONE} -- Private objects

-- The generic calculator pad components.

controller: CALCULATOR_VIEW_CONTROLLER
horizontalBox: EV_HORIZONTAL_BOX
button: EV_BUTTON
fontToUse: EV_FONT

--------------------------------------------------------------------------------
feature {NONE}-- Creation

make(theController : CALCULATOR_VIEW_CONTROLLER;
     theVerticalBox : EV_VERTICAL_BOX)
  local
    verticalBox: EV_VERTICAL_BOX
    font_const: EV_FONT_CONSTANTS
    dummyLabel: EV_LABEL
    number_color: EV_COLOR
    operator_color: EV_COLOR
    control_color: EV_COLOR
    segue_color: EV_COLOR
  do
  	controller := theController
  	verticalBox := theVerticalBox
  	create font_const
  	create fontToUse.make_with_values (font_const.Family_typewriter,
                                       font_const.weight_bold,
                                       font_const.shape_regular,
                                       point_size_18)
  	create number_color.make_with_rgb (1,1,0)
  	create operator_color.make_with_rgb (0,1,1)
  	create control_color.make_with_rgb (1,0,1)
  	create segue_color.make_with_rgb (1, 1, 1)

    create labelFunction.make_with_text (initCalculationMsg)
      labelFunction.set_font (fontToUse)
      labelFunction.set_minimum_height (60)
      verticalBox.extend (labelFunction)

    create labelValue.make_with_text ("0")
      labelValue.set_background_color (create {EV_COLOR}.make_with_rgb(1,1,0))
      labelValue.align_text_right
        addLabelToBox(labelValue, verticalBox)

    create dummyLabel
    verticalBox.extend (dummyLabel)

    create horizontalBox

    newButton("Clear", agent controller.clearPressed, control_color, horizontalBox)
    newButton("Undo", agent controller.undoPressed, control_color, horizontalBox)
    newButton("Graph", agent controller.graphPressed, segue_color, horizontalBox)
    create button.make_with_text_and_action ("/", agent controller.dividePressed)
      button.set_minimum_width (71)
      button.set_background_color (operator_color)
      addButtonToBox(button, horizontalBox)
    verticalBox.extend (horizontalBox)

    create horizontalBox
    newButton("7", agent controller.sevenPressed, number_color, horizontalBox)
    newButton("8", agent controller.eightPressed, number_color, horizontalBox)
    newButton("9", agent controller.ninePressed, number_color, horizontalBox)
    newButton("*", agent controller.multiplyPressed, operator_color, horizontalBox)
    verticalBox.extend (horizontalBox)

    create horizontalBox
    newButton("4", agent controller.fourPressed, number_color, horizontalBox)
    newButton("5", agent controller.fivePressed, number_color, horizontalBox)
    newButton("6", agent controller.sixPressed, number_color, horizontalBox)
    newBUtton("-", agent controller.subtractPressed, operator_color, horizontalBox)
    verticalBox.extend (horizontalBox)

    create horizontalBox
    newButton("1", agent controller.onePressed, number_color, horizontalBox)
    newButton("2", agent controller.twoPressed, number_color, horizontalBox)
    newButton("3", agent controller.threePressed, number_color, horizontalBox)
    newButton("+", agent controller.addPressed, operator_color, horizontalBox)
    verticalBox.extend (horizontalBox)

    create horizontalBox
    create button.make_with_text_and_action ("0", agent controller.zeroPressed)
      button.set_background_color (number_color)
      button.set_minimum_width (52)
      addButtonToBox(button, horizontalBox)
    newButton("+/-", agent controller.changeSignPressed, control_color, horizontalBox)
    newButton(".", agent controller.periodPressed, number_color, horizontalBox)
    newButton("Enter", agent controller.enterPressed, control_color, horizontalBox)
    verticalBox.extend (horizontalBox)

    create horizontalBox
    newButton("sqrt", agent controller.sqrtPressed, operator_color, horizontalBox)
    newButton("sin", agent controller.sinPressed, operator_color, horizontalBox)
    newButton("cos", agent controller.cosPressed, operator_color, horizontalBox)
    newButton(" Pi ", agent controller.piPressed, number_color, horizontalBox)
    verticalBox.extend (horizontalBox)

    create horizontalBox
    newButton("x", agent controller.xPressed, number_color, horizontalBox)
    create dummyLabel
        dummyLabel.set_minimum_width (200)
        horizontalBox.extend (dummyLabel)
    verticalBox.extend (horizontalBox)

    create dummyLabel
      dummyLabel.set_minimum_height (40)
    verticalBox.extend (dummyLabel)
  end

--------------------------------------------------------------------------------
feature {NONE} -- Support

addLabelToBox(label: EV_LABEL; box: EV_BOX)
  do
    label.set_font (fontToUse)
    box.extend (label)
    box.disable_item_expand (label)
  end

addButtonToBox(theButton: EV_BUTTON; box: EV_BOX)
  do
    theButton.set_font (fontToUse)
    box.extend (theButton)
  end

newButton(theLabel : STRING; theagent : PROCEDURE[TUPLE ];
          theColor: EV_COLOR; theBox : EV_HORIZONTAL_BOX)
  do
    create button.make_with_text_and_action (theLabel, theAgent)
    button.set_font (fontToUse)
    button.set_background_color (theColor)
    horizontalBox.extend (button)
  end

end
