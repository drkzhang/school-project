note
	description: "Objects that represent speakers"
	author: "Jingmian Zhang"
	date: "2016.11.13"

deferred class SPEAKER
  inherit PERSON
  			rename make_person as make_speaker end
            -- ?? replace with one clause

---------------------------------------------------------------------------------
feature -- Initialization

make_speaker (output : PLAIN_TEXT_FILE) deferred end

---------------------------------------------------------------------------------
feature -- Output

print_speaker(output : PLAIN_TEXT_FILE)
  do
    output.put_string ("Print_speaker in SPEAKER%N")
  end

end
