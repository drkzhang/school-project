note
	description: "Objects that represent tutorial attendees"
	author: "Jingmian Zhang"
	date: "2016.11.13"

 class TUT_ATTENDEE
  inherit ATTENDEE
            -- ?? replace with one clause
			rename make_attendee as make_tut_attendee end
create make_tut_attendee

---------------------------------------------------------------------------------
feature {NONE} -- Initialization

make_tut_attendee (output : PLAIN_TEXT_FILE)
  do
    output.put_string ("Make_tut_attendee in TUT_ATTENDEE%N")
  end

---------------------------------------------------------------------------------
feature -- Output

print_person(output : PLAIN_TEXT_FILE)
  do
    output.put_string ("Print_person in TUT_ATTENDEE%N")
  end

end
