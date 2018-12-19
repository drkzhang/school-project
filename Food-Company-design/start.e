note
  description: "Start of food company system execution"
  author: "Yichun Dai, Jingmian Zhang"
  date: "2016,10,10"
  version: "2.0"

class START

create make

--------------------------------------------------------------------------------
feature {NONE} -- Attribute
customer:LINKED_LIST[CUSTOMER]  --- A list of customer
producer:LINKED_LIST[PRODUCER]  --- A list of producer
customer_with_good_credit:LINKED_LIST[CUSTOMER] --- A list of customers who have good credit status
credit_good:INTEGER = 50  --- Assume above 50 is good credit
specific_producer:LINKED_LIST[PRODUCER] --- A list of produces who produce specific food
food_expire_at_date:LINKED_LIST[FOOD] --- A list of food which will expire at a certain date
inventory:LINKED_LIST[FOOD]  --- A list of food in stock
contacts:LINKED_LIST[CONTACT] --- A list of contacts of customers and producers

feature {NONE} -- Creation

make
  -- Initialization for `Current'.
  do                           -----  Initialize all lists
  	create customer.make
	create producer.make
	create customer_with_good_credit.make
	create specific_producer.make
	create food_expire_at_date.make
	create inventory.make
	create contacts.make
  end




---------------------------
feature

	list_customer_with_good_credit  ------list the customers with good credit status
		do
			from customer.start    --- search customer list
			until customer.off
			loop
				if customer.item.get_credit > credit_good
				then customer_with_good_credit.put(customer.item) --- if the customer's credit points is greater that the
				                                                  ---  good credit, then put the customer into the
				                                                  --- customer_with_good_credit list
				end
			end
		end

----------------------------------------------------
feature
	expire_at_certain_date(d:DATE)    --- Check if there is food which expires at this date
		do
			from inventory.start   --- search inventory list
			until inventory.off
			loop
				if inventory.item.expire_date.is_equal (d)
				then food_expire_at_date.put (inventory.item)  --- If the food's expire date is equal to this date,
															   --- then put it into food_expire_at_date list
				end
			end
		end

-------------------------------------------------------------
feature
	producer_offers_specific(f:FOOD)   --- To check which producer produces this food
		do
			from producer.start   --- search producer list
			until producer.off
			loop
				if producer.item.search(f)
				then specific_producer.put (producer.item)  --- If the food matches, put this proucer into specific_producer list

				end
			end
		end
-----------------------------------------------------------
feature
	add_customer(c:CUSTOMER)  --- customer list adder
		do
			customer.put (c)
		end

	remove_customer(c:CUSTOMER)  --- customer list remover
		do
			customer.prune (c)
		end

	add_producer(p:PRODUCER)   --- producer list adder
		do
			producer.put (p)
		end

	remover_producer(p:PRODUCER)  --- producer list remover
		do
			producer.prune(P)
		end



end
