note
  description: "Summary description for {GRAPH_VIEW}."
  author: "G.J. Gotshalks"
  date: "2016 March 22"
  revision: "V1.0"

class
	GRAPH_VIEW

create make

--------------------------------------------------------------------------------
feature {NONE} -- Constants

point_size_18: INTEGER = 18

--------------------------------------------------------------------------------
feature {FUNCTION_GRAPH_VC} -- Objects

labelFunction: EV_LABEL

--------------------------------------------------------------------------------
feature {GRAPH_VIEW} -- Controller

controller: FUNCTION_GRAPH_VC

--------------------------------------------------------------------------------
feature {NONE} -- Private objects

fontToUse: EV_FONT
font_const: EV_FONT_CONSTANTS
graphArea: EV_DRAWING_AREA
height: INTEGER
width:INTEGER

--------------------------------------------------------------------------------
feature {NONE} -- Creation

make (theController: FUNCTION_GRAPH_VC; view : EV_VERTICAL_BOX)
  local
    button: EV_BUTTON
    horizontalBox: EV_HORIZONTAL_BOX
  do
  	controller := theController
  	create font_const
  	create fontToUse.make_with_values (font_const.Family_typewriter,
                                       font_const.weight_bold,
                                       font_const.shape_regular,
                                       point_size_18)
    view.wipe_out
    create horizontalBox
      horizontalBox.set_background_color (create {EV_COLOR}.make_with_rgb(0,0,1))
    create button.make_with_text_and_action ("Calculator Pad",
             agent controller.returnFromGraphVC)
      addButtonToBox(button, horizontalBox)
      horizontalBox.disable_item_expand (button)
    view.extend (horizontalBox)
    view.disable_item_expand (horizontalBox)

    create labelFunction.make_with_text ("y = ???")
      labelFunction.set_background_color (create {EV_COLOR}.make_with_rgb(1,1,0))
      addLabelToBox(labelFunction, view)
    create graphArea
      view.extend (graphArea)

    graphArea.clear
    height := graphArea.height
    width := graphArea.width
  end

--------------------------------------------------------------------------------
feature {FUNCTION_GRAPH_VC} -- Operations

plotGraph
  local
    xView, prevXview: INTEGER
    yView, prevYview: INTEGER
    scale: REAL
    xValue, xValueMin, xValueMax, xIncrement: REAL
    yValue,yValueMin, yValueMax : REAL
  do
    graphArea.set_foreground_color (create {EV_COLOR}.make_with_rgb(0,1,0))
    graphArea.set_line_width (2)
    scale := 10/width.to_real
    xValueMin := -width.to_real/2 * scale
    xValueMax := -xValueMin
    xValue := xValueMin
    xIncrement := (xValueMax - xValueMin)/width
    yValueMax := xIncrement * height/2
    yValueMin := -yValueMax

    from
      prevXview := 0
      prevYview := (height*(yValueMax - controller.getYvalueForXvalue (xValueMin))
                   /(yValueMax - yValueMin)).truncated_to_integer
    until xValue > xValueMax
    loop
      xView := xView + 1
      xValue := xValue + xIncrement
    	yValue := controller.getYvalueForXvalue (xValue)
    	yView := (height*(yValueMax - yValue)/(yValueMax - yValueMin)).truncated_to_integer
      graphArea.draw_segment (prevXView, prevYview, xView, yView)
      prevXview := xView
      prevYview := yView
    end
  end

drawAxis
  do
    graphArea.draw_segment(width//2, 0, width//2, height)
    graphArea.draw_segment(0, height//2, width, height//2)
  end

--------------------------------------------------------------------------------
feature {NONE} -- Support

addButtonToBox(label: EV_BUTTON; box: EV_BOX)
  do
    label.set_font (fontToUse)
    box.extend (label)
  end

addLabelToBox(label: EV_LABEL; box: EV_BOX)
  do
    label.set_font (fontToUse)
    box.extend (label)
    box.disable_item_expand (label)
  end

end
