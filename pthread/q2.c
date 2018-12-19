#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
pthread_mutex_t filemut = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t start_line = PTHREAD_COND_INITIALIZER;
int num, count = 0, m;

void *ThreadEntry(void *threadid)
{
    int time = 0;
    long t;
    t = (long) threadid;
    pthread_mutex_lock( &filemut );//block all other threads


    FILE *f = fopen("pthread_stats", "a+");//open file, if it doesn't exist, create one
    if (f == NULL)
    {
        f = fopen("pthread_stats", "w+");
    }
	for(;time<m;time++)//write tid m times
	{
	 fprintf(f, "%ld \n", pthread_self());//write tid to file
	}
   
    printf("thread %ld has completed writing to the file pthread_stats, with tid %ld \n", t, pthread_self());
    fclose(f);


    // increase the count of threads that have finished their work.
    count++;

    // wait up the main thread to test value of count
    pthread_cond_signal( &start_line );
    pthread_mutex_unlock( &filemut );


}
int main(int argc, char *argv[])
{
    int rc;
    long t;
    if(argv[1] != NULL) //take N from argument
    {
        num = atoi(argv[1]);
    }
    if(num == 0)// if no N is provided, use 100
    {
        num = 100;

    }
    printf("the number of threads about to be created is %d\n", num);
    if(argv[2] != NULL) //take M from argument
    {
        m = atoi(argv[2]);
    }
    if(m == 0)// if no M is provided, use 1000
    {
        m = 1000;

    }
    printf("the number of times each about to be run is %d\n", m);
    pthread_t threads[num];

    for(t=0; t<num; t++) {
        rc = pthread_create(&threads[t], NULL, ThreadEntry,(void *)t);//create threads
        if (rc) {
            printf("ERROR; return code from pthread_create() is %d\n", rc);
            exit(-1);
        }
    }

    pthread_mutex_lock( &filemut );

    while( count < num )
    {

        // block this thread until everyone finishes their work
        pthread_cond_wait( & start_line, &filemut );

    }


    pthread_mutex_unlock( &filemut );
    int j;// join everyone
    for(j=0; j < num; j++)
    {
        pthread_join( threads[j], NULL);
    }
    printf( "everyone is done, count is %d\n",
            count );
    pthread_exit(NULL);
}



