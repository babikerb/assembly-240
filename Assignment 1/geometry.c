//*****************************************************************************************************************************
/*
 Copyright (C) 2025 Babiker Babiker.

 This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
 version 3 as published by the Free Software Foundation. This program is distributed in the hope that it will be useful, but
 WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 General Public License for more details. A copy of the GNU General Public License v3 is  available here: 
 https://www.gnu.org/licenses/.
*/

// Author: Babiker Babiker
// Author Email: bbabiker@csu.fullerton.edu
// CWID: 871026449
// Class: 240-11 Section 11
// Program name: Triangles
// Programming Languages: One module in C, one in X86-64, and one in bash.
// Date Program Began: 2025-Jan-24
// Date of Last Update: 2025-Jan-24
// Files in this Program: geometry.c, triangle.asm, r.sh.
// This program calculates the third side of a triangle given lengths of the other two sides and an angle in degrees

// This File:
//   File Name: geometry.c
//   Language: C language
//*****************************************************************************************************************************

#include <stdio.h>
#include <math.h>

extern double compute();

int main()
{
    printf("\n\nWelcome to the Triangle program maintained by Babiker Babiker.\n");
    printf("If errors are discovered please report them to Babiker Babiker at bbabiker@csu.fullerton.edu for a quick fix.\n");
    printf("At CSUF software the customer comes first.\n");
    double side_c = compute();
    printf("The main function received this number %.8lf and plans to keep it until needed.", side_c);
    printf("\nAn integer zero will be returned to the operating system. Bye.\n");
    return 0;
}
