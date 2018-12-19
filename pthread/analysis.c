#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
int main(void)
{
    FILE * fp;
    char ch;
    int size = 0;
    char * line = NULL;
    char line1[1000];
    char * next_line = NULL;
    char next_line1[1000] = "start";
    size_t len = 0;
    ssize_t read;
    int consecutive = 1;
    int denominator = 1;//denominator of the mean equation
    int compare = 0;
    int i = 0;

    fp = fopen("pthread_stats", "r");// open file and then count the number of lines
    if (fp == NULL)
    {
        printf("pthread_stats does not exist\n");
        exit(EXIT_FAILURE);
    }
    while(!feof(fp))
    {
        ch = fgetc(fp);
        if(ch == '\n')
        {
            size++;
        }
    }
    fclose(fp);//close file
    float numerator[size];//numerator[i] is every numerator of the mean equation
// initialize an array with size = number of line, the number of numerator for cannot be greater than size
    fp = fopen("pthread_stats", "r");//open file again for getting mean
    while ((read = getline(&line, &len, fp)) != -1) {//compare line with previous line
        strcpy(line1,line);
        if (strcmp(next_line1,"start") !=0) {// the first next_line will be null, which is singaled by next_line1 being "start"
            compare = strcmp(line1, next_line1);
            if(compare == 0)
            {
                consecutive++;//same thread
            }
            else {//different thread
                numerator[i] = consecutive;//assign numerator[i] to consecutive
                i++;
                consecutive = 1;
                denominator++;

            }


        }//compare line with next line
        if((read = getline(&next_line, &len,fp))!= -1) {
            strcpy(next_line1,next_line);

            compare = strcmp(line1, next_line1);
            if(compare == 0)//same thread
            {
                consecutive++;
            }
            else {//different thread
                numerator[i] = consecutive;
                i++;
                consecutive = 1;
                denominator++;

            }
        }
    }
    if(consecutive != 1)//assign the last numerator[i]
    {
        numerator[i] = consecutive;
    }
    else
    {
        numerator[i] = 1;
    }

    fclose(fp);
    free(line);
    float mean;
    float sum = 0, sum1=0, variance, std_deviation;
    int j;
    for(j = 0; j<=i; j++)//calculate the mean
    {
        sum = sum + numerator[j];
    }
    mean = sum / (float) denominator;

    for (j = 0;  j<= i; j++)

    {

        sum1 = sum1 + pow((numerator[j] - mean), 2);

    }

    variance = sum1 / (float)denominator;

    std_deviation = sqrt(variance);//calculate the standard deviation
    printf("mean of all elements = %.2f\n", mean);


    printf("Standard deviation = %.2f\n", std_deviation);

    exit(EXIT_SUCCESS);
}
