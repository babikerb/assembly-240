// Author Name: Babiker Babiker
// CWID: 6449
// Section Number: 240-11
// Author Email: bbabiker@csu.fullerton.edu
// Date: 4/24/2025
// Identifier: Final Program

#include <stdio.h>

extern double manager();

int main()
{
    printf("Welcome to Variance of the Sample programmed by Chris Sawyer.\n");

    double result = manager();

    printf("The driver function received this number %.6lf and will keep it for reference.\n", result);
    printf("A zero will not be returned to the OS. Bye\n");

    return 0xA;
}
