note
	description: "Objects that represent conference attendees"
	author: "Jingmian Zhang"
	date: "2016.11.13"

class CONF_ATTENDEE
  inherit ATTENDEE
            -- ?? replace with one clause
			rename print_person as  print_conf_attendee
			 end
create make_attendee

---------------------------------------------------------------------------------
feature {NONE} -- Initialization

make_attendee (output : PLAIN_TEXT_FILE)
  do
    output.put_string ("Make_attendee in CONF_ATTENDEE%N")
  end

---------------------------------------------------------------------------------
feature -- Output

print_conf_attendee(output : PLAIN_TEXT_FILE)
  do
    output.put_string ("Print_conf_attendee in CONF_ATTENDEE%N")
  end

end
