note
	description: "Objects that represent conference speakers"
	author: "Jingmian Zhang"
	date: "2016.11.13"

 class CONF_SPEAKER
  inherit AUTHOR
  redefine print_person end
            -- ?? replace with one clause
          CONF_ATTENDEE
			rename make_attendee as make_person
  				redefine make_person
  				select print_conf_attendee
  				end
            -- ?? replace with three clauses
          SPEAKER
          rename make_speaker as make_person end
            -- ?? replace with one clause

create make_person

---------------------------------------------------------------------------------
feature {NONE} -- Initialization

make_person (output : PLAIN_TEXT_FILE)
  do
    output.put_string ("Make_person in CONF_SPEAKER%N")
  end

---------------------------------------------------------------------------------
feature -- Output

print_person(output : PLAIN_TEXT_FILE)
  do
    output.put_string ("Print_person in CONF_SPEAKER%N")
  end

end
