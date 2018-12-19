note
	description: "Objects that represent conference attendees"
	author: "Jingmian Zhang"
	date: "2016.11.13"

deferred class ATTENDEE
  inherit PERSON
            rename make_person as make_attendee end
            -- ?? replace with one clause

---------------------------------------------------------------------------------
feature -- Output

print_attendee (output : PLAIN_TEXT_FILE)
  do
    output.put_string ("Print_attendee in ATTENDEE%N")
  end

end
