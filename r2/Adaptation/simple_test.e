note
	description: "Simple test for inheritance adaptation"
	author: "Gunnar Gotshalks"

class SIMPLE_TEST

create make

---------------------------------------------------------------------------------
feature -- The components

out_name : STRING = "adaptation_output.text" -- Output file name
output : PLAIN_TEXT_FILE

at  : ATTENDEE
au  : AUTHOR
ca  : CONF_ATTENDEE
cs  : CONF_SPEAKER
cta : CONF_TUT_ATTENDEE
ins : INVITED_SPEAKER
pe  : PERSON
sp  : SPEAKER
ta  : TUT_ATTENDEE
ts  : TUT_SPEAKER

---------------------------------------------------------------------------------
feature {NONE} -- Creation

make
  do
  	create output.make_open_write(out_name)
    output.put_string ("First line of inheritance test.%N%N")
    create_components
    test_body
    output.put_string ("%NLast line of inheritance test.%N")
    output.close
  end

create_components
  do
  	output.put_string ("================================================%N")
  	output.put_string ("*** Create an instance of each object type%N%N")
    create ca.make_attendee (output)
    create cs.make_person (output)
    create cta.make_conf_tut_attendee (output)
    create ins.make_speaker (output)
    create ta.make_tut_attendee (output)
    create ts.make_person (output)
    output.new_line
  end

test_body
  do
  	output.put_string ("================================================%N")
    output.put_string ("*** Routines for conference attendees%N%N")
    ca.print_attendee (output)
    ca.print_conf_attendee (output)
    at := ca
    at.make_attendee (output)
    at.print_attendee (output)
    at.print_person (output)
    pe := ca
    pe.make_person (output)
    pe.print_person (output)
    output.put_new_line

  	output.put_string ("================================================%N")
    output.put_string ("*** Routines for tutorial attendees%N%N")
    ta.print_attendee (output)
    ta.print_person (output)
    at := ta
    at.make_attendee (output)
    at.print_attendee (output)
    at.print_person (output)
    pe := at
    pe.make_person (output)
    pe.print_person (output)
    output.put_new_line

  	output.put_string ("================================================%N")
    output.put_string ("*** Routines for conference & tutorial attendees%N%N")
    cta.print_attendee (output)
    cta.print_conf_attendee (output)
    cta.print_person (output)
    ca := cta
    ca.print_attendee (output)
    ca.print_conf_attendee (output)
    ta := cta
    ta.print_attendee (output)
    ta.print_person (output)
    at := cta
    at.make_attendee (output)
    at.print_attendee (output)
    at.print_person (output)
    pe := cta
    pe.make_person (output)
    pe.print_person (output)
    output.put_new_line

  	output.put_string ("================================================%N")
    output.put_string ("*** Routines for invited speakers%N%N")
    ins.print_attendee (output)
    ins.print_conf_attendee (output)
    ins.print_person (output)
    ins.print_speaker (output)
    cta := ins
    ins.print_attendee (output)
    ins.print_conf_attendee (output)
    ins.print_person (output)
    ins.print_speaker (output)
    ca := ins
    ca.print_attendee (output)
    ca.print_conf_attendee (output)
    ta := ins
    ta.print_attendee (output)
    ta.print_person (output)
    at := ins
    at.make_attendee (output)
    at.print_attendee (output)
    at.print_person (output)
    sp := ins
    sp.make_speaker (output)
    sp.print_person (output)
    sp.print_speaker (output)
    pe := ins
    pe.make_person (output)
    pe.print_person (output)
    output.put_new_line

  	output.put_string ("================================================%N")
    output.put_string ("*** Routines for conference speakers%N%N")
    cs.print_attendee (output)
    cs.print_conf_attendee (output)
    cs.print_person (output)
    cs.print_speaker (output)
    ca := cs
    ca.print_attendee (output)
    ca.print_conf_attendee (output)
    at := cs
    at.make_attendee (output)
    at.print_attendee (output)
    at.print_person (output)
    sp := cs
    sp.make_speaker (output)
    sp.print_person (output)
    sp.print_speaker (output)
    au := cs
    au.make_person (output)
    au.print_person (output)
    pe := cs
    pe.make_person (output)
    pe.print_person (output)

    output.put_new_line

  	output.put_string ("================================================%N")
    output.put_string ("*** Routines for tutorial speakers%N%N")
    ts.print_attendee (output)
    ts.print_person (output)
    ts.print_speaker (output)
    ta := ts
    ta.print_attendee (output)
    ta.print_person (output)
    at := ts
    at.make_attendee (output)
    at.print_attendee (output)
    at.print_person (output)
    sp := ts
    sp.make_speaker (output)
    sp.print_person (output)
    sp.print_speaker (output)
    au := ts
    au.make_person (output)
    au.print_person (output)
    pe := ts
    pe.make_person (output)
    pe.print_person (output)
    output.put_new_line

  end
end
