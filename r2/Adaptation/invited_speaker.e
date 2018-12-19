note
	description: "Objects that represent invited speakers"
	author: "Jingmian Zhang"
	date: "2016.11.13"

 class INVITED_SPEAKER
  inherit CONF_TUT_ATTENDEE
			redefine print_person end
            -- ?? replace with one clause
          SPEAKER
          select make_speaker, print_person end
            -- ?? replace with one clause

create make_speaker

-------------------------------------------------------------------------------
feature {NONE} -- Initialization

make_speaker (output : PLAIN_TEXT_FILE)
  do
    output.put_string("make_speaker in INVITED_SPEAKER%N")
  end

---------------------------------------------------------------------------------
feature -- Output

print_person(output : PLAIN_TEXT_FILE)
  do
    output.put_string("Print_person in INVITED_SPEALER%N")
  end

end
