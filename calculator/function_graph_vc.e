note
  description: "View Controller for a graph"
  author: "G.J. Gotshalks"
  date: "2013 January 7"
  revision: "V1.0"

class FUNCTION_GRAPH_VC

create make

--------------------------------------------------------------------------------
feature {NONE} -- Communications


--------------------------------------------------------------------------------
feature {GRAPH_VIEW} -- Objects

delegate: CALCULATOR_VIEW_CONTROLLER
dataSource: CALCULATOR_VIEW_CONTROLLER

--------------------------------------------------------------------------------
feature {NONE} -- Constants

point_size_18: INTEGER = 18

--------------------------------------------------------------------------------
feature {NONE} -- Creation

make (view : EV_VERTICAL_BOX;
      theDelegate: CALCULATOR_VIEW_CONTROLLER
      theDataSource: CALCULATOR_VIEW_CONTROLLER)
  local
    graph_view: GRAPH_VIEW
  do
  	delegate := theDelegate
  	dataSource := theDataSource
  	create graph_view.make(Current, view)
  	graph_view.labelFunction.set_text("y = " + dataSource.getFunctionDescription)
    graph_view.drawAxis
    graph_view.plotGraph
  end

--------------------------------------------------------------------------------
feature {GRAPH_VIEW}-- Actions

getYvalueForXvalue(xValue: REAL) : REAL
  do
    Result := dataSource.getyvalueforxvalue (xValue)
  end

returnFromGraphVC
  do
    delegate.returnFromGraphVC
  end

end
