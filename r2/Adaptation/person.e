note
	description: "Objects that represent people"
	author: "Gunnar Gotshalks"

deferred class PERSON

---------------------------------------------------------------------------------
feature -- Initialization

make_person (output : PLAIN_TEXT_FILE) deferred end

---------------------------------------------------------------------------------
feature -- Output

print_person(output : PLAIN_TEXT_FILE) deferred end

end
