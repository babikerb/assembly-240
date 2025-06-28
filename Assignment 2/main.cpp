#include <iostream>
#include <stdio.h>
extern "C" double manager();

int main() {
    std::cout << "\n\nWelcome to Arrays of floating point numbers.\n";
    double result = manager();
    std::cout << "Main received " << result << ", and will keep it for future use.\n";
    std::cout << "Main will return 0 to the operating system. Bye." << std::endl;
    return 0;
}