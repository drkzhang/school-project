note
	description: "Objects that represent authors"
	author: "Jingmian Zhang"
	date: "2016.11.13"

deferred class AUTHOR
  inherit PERSON

---------------------------------------------------------------------------------
feature -- Output

print_person(output : PLAIN_TEXT_FILE)
  do
    output.put_string ("Print_person in AUTHOR%N")
  end

end
