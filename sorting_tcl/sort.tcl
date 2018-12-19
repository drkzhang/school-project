#prompt user to enter integers
puts "Please enter a list of integers" 
#getting input from standard input and store it as one string in #a list called input
while {[gets stdin line]} {
    append input $line
}
# use split method to split the string into a list,
# Then use foreach loop to iterate through all list #element, in order to only append elements that are integer to #the new list.
    set data [split $input]
    foreach num $data {
    if {[string is integer -strict $num]} {
#string is ? Returns 1 if string is a valid member of the #specified character class, otherwise returns 0.
            lappend mylist $num
        } 
    }
#bubble sort method
for {set i 0} {$i < ([llength "$mylist"]-1)} {incr i} {
    for {set j 0} {$j < ([llength "$mylist"]-1-$i) } {incr j} {
	 set a [expr {$j + 1}];#somehow prism lab has to require this step to compare $j and $j+1
				# simply comparing [lindex $mylist $j] and [lindex $mylist $j+1]
				#will produce an error only in prism lab
        if {[lindex $mylist $j] > [lindex $mylist $a]} { 
#swap the element in the list
            set temp [lindex $mylist $a]
            lset mylist $a [lindex $mylist $j]
            lset mylist $j $temp
        }
    }
}
puts $mylist; #output the sorted list
