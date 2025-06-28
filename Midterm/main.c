//******************************************************************************************************************************
//  Author name: Babiker Babiker
//  Author email: bbabiker@csu.fullerton.edu
//  CWID: 871026449
//  Class: 240-11 Section 11
//  Date: March 11, 2025
//  240-11 Midterm Program
//  file name: main.c
//  Preferred Email Address: bbabiker@csu.fullerton.edu
//******************************************************************************************************************************

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern double electricity();

int main (void) {
 printf("\nWelcome to West Beach Electric Company.\n");
 printf("This software is maintained by Babiker Babiker\n\n");
 
 double count = 0;
 count = electricity();
 
 printf("\nThe main received this number %.5lf and will keep it for later.\n",count);
 printf("A zero will be returned to the operating system. Bye.\n");
 return 0;
}
