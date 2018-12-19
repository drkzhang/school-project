note
  description: "Objects that describe calculator program items"
  author: "G.J. Gotshalks"
  date: "2013 January 7"
  revision: "V1.0"

deferred class PROGRAM_ITEM

--------------------------------------------------------------------------------
feature -- Objects

text: STRING
feature
describe: STRING deferred end
accept(visitor: VISITOR; ps : ARRAYED_STACK[PROGRAM_ITEM]) : REAL
deferred end

end
