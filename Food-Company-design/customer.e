note
	description: "Summary description for {CUSTOMER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CUSTOMER

create make

-----------------------------------

feature {NONE} --- Attribute, customer class constructor
customer_name:STRING
customer_credit:INTEGER

feature {NONE}

make(name:STRING)

	do
		customer_name := name
	end

feature
set_credit(c:INTEGER)   --- credit setter
	do
		customer_credit := c
	end

get_credit:INTEGER   --- credit getter
	local
		credit:INTEGER
	do
		credit := customer_credit
	end

end
