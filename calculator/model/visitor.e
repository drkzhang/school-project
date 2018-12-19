note
	description: "Summary description for {VISITOR}."
    author: "Jingmian Zhang"
    date: "2016.12.4"
	revision: "$Revision$"

deferred class
	VISITOR
feature --visit feature
visit_operator(op: OPERATOR; ps: ARRAYED_STACK[PROGRAM_ITEM]): REAL
deferred
end
visit_number(num: NUMBER):REAL
deferred
end
visit_variable(var: VARIABLE): REAL
deferred
end
end
