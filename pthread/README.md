# pthread
 Probabilistic Analysis of Pthreads.
 the program lets threads write to the same file
using mutexes to avoid race conditions. The main thread creates N (N is an optional command
line argument by dafault 100) threads and all of them immediately block on condition
variable start_line. After all threads are created, the main thread wakes them up
and then waits until they all terminate with join. The threads after waking up lock the
mutex filemut and write their TID followed by newline to file pthread_stats and
then release the mutex. After they do this M times each (the second optional command
line argument that defaults to 1000) they join the main thread.

Analysis.c analyzes the mean and standard deviation of the
“runs”. A run is the number of consecutive writes by the same thread.
