note
	description: "Summary description for {PRODUCEER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PRODUCER
create make
----------------------------------------------------
feature {NONE} -- Attribute
producer_name: STRING   --- producers' name
food_produce:LINKED_LIST[FOOD]  --- a list of the food producer produce

----------------------------------------------------
feature {NONE}  --- producer class constructor

make(name:STRING)

	require
		name /= void
	do
		producer_name := name
		create food_produce.make
	end

------------------------------------------------------
feature

	add(food:FOOD)     --- food_produce adder
		do
			food_produce.put(food)
		end

feature
	remove(food:FOOD)   --- food_produce remover
		do
			food_produce.prune(food)
		end

feature
	search(food:FOOD):BOOLEAN   --- search for specific food
		local
			matches:BOOLEAN
		do
			matches := food_produce.has(food)
		end





end
