note
	description: "Summary description for {CONTACT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTACT

create make

----------------------------------------------
feature {NONE} --- Attribute
customer_contact: detachable CUSTOMER
producer_contact:detachable PRODUCER
address:STRING
emptystring:STRING = ""
feature {NONE}

make

	do
		customer_contact := void
		producer_contact := void
		address := emptystring
	end

feature

set_customer(c:CUSTOMER)   --- customer's contact setter
	do
		customer_contact := c
	end

set_producer(p:PRODUCER)  --- producer's contact setter
	do
		producer_contact := p
	end

set_address(ad:STRING)  --- customer or producer's address setter
	do
		address := ad
	end
end

