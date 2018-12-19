note
	description: "Summary description for {FOOD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FOOD

create make

---------------------------------------------
feature  --- Attribute, food class constructor

food_name: STRING
expire_date: DATE

feature  --- can be exported by class START

make(name:STRING; expire: DATE)

	do
		food_name := name
		expire_date := expire
	end



end
