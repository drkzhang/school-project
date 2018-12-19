note
	description: "Objects that represent conference and tutorial attendees"
	author: "Jingmian Zhang"
	date: "2016.11.13"

 class CONF_TUT_ATTENDEE
  inherit CONF_ATTENDEE
  				rename make_attendee as make_conf_tut_attendee
  				redefine print_conf_attendee, make_conf_tut_attendee
  				select print_conf_attendee
  				end
            -- ?? replace with three clauses
          TUT_ATTENDEE
           rename make_tut_attendee as make_conf_tut_attendee
           redefine make_conf_tut_attendee

           end
            -- ?? replace with two clauses

create make_conf_tut_attendee

---------------------------------------------------------------------------------
feature {NONE} -- Initialization

make_conf_tut_attendee (output : PLAIN_TEXT_FILE)
  do
    output.put_string ("Make_conf_tut_attendee in CONF_TUT_ATTENDEE%N")
  end

---------------------------------------------------------------------------------
feature -- Output

print_conf_attendee(output : PLAIN_TEXT_FILE)
do
    output.put_string ("Print_conf_attendee in CONF_TUT_ATTENDEE%N")
end

end
