note
	description: "Objects that represent tutorial speakers"
	author: "Jingmian Zhang"
	date: "2016.11.13"

 class TUT_SPEAKER
  inherit AUTHOR
  			redefine print_person end
            -- ?? replace with one clause
          SPEAKER
          	rename make_speaker as make_person end
            -- ?? replace with one clause
          TUT_ATTENDEE
          rename make_tut_attendee as make_person
          redefine print_person, make_person end
            -- ?? replace with two clauses

create make_person

---------------------------------------------------------------------------------
feature {NONE} -- Initialization

make_person (output : PLAIN_TEXT_FILE)
  do
    output.put_string ("Make_person in TUT_SPEAKER%N")
  end

---------------------------------------------------------------------------------
feature -- Output

print_person(output : PLAIN_TEXT_FILE)
  do
    output.put_string ("Print_person in TUT_SPEAKER%N")
  end

end
